# ⚠️ Breaking Changes & Pitfalls — Zig 0.16.0

## 1. `std.Build` vs `std.build.Builder` (KRITIS!)

```zig
// ❌ SALAH — Pola lama (0.11 ke bawah), TIDAK AKAN COMPILE di 0.16
const Builder = std.build.Builder;
pub fn build(b: *Builder) void { ... }

// ❌ SALAH — Pola lama lainnya
exe = b.addExecutable("nama-app", "src/main.zig");

// ✅ BENAR — Zig 0.16.0
pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "nama-app",
        .root_source_file = b.path("src/main.zig"),  // b.path(), bukan .path = "..."
        .target = target,
        .optimize = optimize,
    });
}
```

## 2. Source File Path — `b.path()` bukan String Literal

```zig
// ❌ SALAH di 0.14+ — path string langsung tidak diterima
.root_source_file = .{ .path = "src/main.zig" }, // LazyPath.path deprecated!

// ✅ BENAR — gunakan b.path()
.root_source_file = b.path("src/main.zig"),
```

## 3. `GeneralPurposeAllocator` — Cara Init yang Benar

```zig
// ❌ SALAH — tidak ada default config yang tepat di beberapa versi lama
var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};

// ✅ BENAR di 0.16.0 — gunakan default config
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();  // ingat: deinit() return .leak bila ada leak!
const allocator = gpa.allocator();

// Cara deteksi memory leak:
const result = gpa.deinit();
if (result == .leak) {
    std.debug.print("MEMORY LEAK TERDETEKSI!\n", .{});
}
```

## 4. `for` Loop — Sintaks Baru di 0.12+

```zig
// ❌ SALAH — sintaks for lama (Zig < 0.11)
for (slice) |item, index| { ... }

// ✅ BENAR — Zig 0.12+ termasuk 0.16.0
for (slice, 0..) |item, index| { ... }
//              ^^^^ ini adalah "multi-object for" dengan index counter

// Iterasi multiple slice sekaligus (fitur baru 0.12+):
for (a_slice, b_slice) |a, b| {
    // a dan b dari posisi yang sama
}
```

## 5. Pitfall: `defer` dengan Loop

```zig
// ⚠️ BAHAYA — defer di dalam loop
for (items) |item| {
    const ptr = try allocator.create(Item);
    defer allocator.destroy(ptr);  // ini dijalankan di AKHIR SETIAP ITERASI
    // ... OK untuk kasus ini, tapi bisa mengejutkan!
}

// ⚠️ BAHAYA LEBIH BESAR — defer dalam fungsi yang dipanggil berkali-kali
// ingat: defer dijalankan saat SCOPE KELUAR, bukan saat akhir fungsi!
{
    const x = try allocator.create(u32);
    defer allocator.destroy(x);  // bebas saat blok {} ini selesai
    // ... gunakan x di sini
} // ← x dibebaskan di sini
```

## 6. Pitfall: `errdefer` vs `defer` — Kapan Masing-masing?

```zig
fn buatSesuatu(allocator: std.mem.Allocator) !*Thing {
    const thing = try allocator.create(Thing);

    // errdefer = cleanup HANYA bila ada error yang dipropagasi dari sini
    errdefer allocator.destroy(thing);

    // Bila salah satu dari ini gagal, errdefer AKAN dijalankan
    try thing.init();
    try thing.connectToDatabase();

    // Bila kita sampai di sini, SEMUA sukses
    // errdefer TIDAK akan dijalankan
    // Caller yang sekarang bertanggung jawab untuk destroy!
    return thing;
}

// Cara pakai yang BENAR di caller:
fn caller(allocator: std.mem.Allocator) !void {
    const thing = try buatSesuatu(allocator);
    defer allocator.destroy(thing);  // caller yang pegang tanggung jawab
    // ...
}
```

## 7. Pitfall: Integer Overflow di Zig

```zig
// Di Debug mode: Zig AKAN PANIC bila overflow!
var x: u8 = 255;
x += 1; // PANIC di Debug mode: "integer overflow"

// Di ReleaseFast: overflow TIDAK dicek (performa maksimum)
// Di ReleaseSafe: overflow DICEK bahkan di release build

// Cara aman untuk operasi yang mungkin overflow:
const result = std.math.add(u8, x, 1) catch {
    // tangani overflow secara eksplisit
    return error.Overflow;
};

// Wrapping arithmetic (sengaja overflow):
const wrapped = x +% 1;  // '%' = wrapping operator
// 255 +% 1 = 0 (tanpa panic)

// Saturating arithmetic:
const sat = x +| 1;     // '|' = saturating operator
// 255 +| 1 = 255 (tetap di nilai maksimum)
```

## 8. `anytype` vs `comptime T: type` — Kapan Mana?

```zig
// anytype — tipe diinfer dari argumen, lebih fleksibel tapi kurang ekspresif
fn cetakApaSaja(writer: anytype, nilai: anytype) !void {
    try writer.print("{any}\n", .{nilai});
}

// comptime T — lebih ekspresif, bisa digunakan dalam tipe return dan operasi lain
fn cetakNilai(comptime T: type, writer: anytype, nilai: T) !void {
    // T dikenal di sini, bisa digunakan untuk logika comptime
    if (@typeInfo(T) == .int) {
        try writer.print("Integer: {d}\n", .{nilai});
    } else {
        try writer.print("Nilai: {any}\n", .{nilai});
    }
}

// REKOMENDASI: gunakan 'comptime T' bila Anda perlu T di dalam fungsi.
// Gunakan 'anytype' untuk writer/stream yang hanya butuh metode tertentu.
```

---

<div align="center">
  <a href="https://github.com/gh0st4n">Gh0sT4n</a> -
  <a href="https://t4n-labs.github.io/t4n-os">T4n OS</a> -
  <a href="https://ziglang.org/documentation/0.16.0">Zig 0.16.0</a>

  <br><br>

  <a href="./04-TugasPraktik.md">&lt;- Previously</a> |
  <a href="#">Next -&gt;</a>
</div>