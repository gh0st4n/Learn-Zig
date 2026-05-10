# Teori Mendalam: Fondasi Zig

## 1. Filosofi Inti - "No Hidden Control Flow"

Sebelum menulis satu baris kode pun, kita harus memahami mengapa Zig ada. Zig bukan lahir karena ingin membuat C yang lebih cantik. Zig lahir karena [Andrew Kelley](https://andrewkelley.me/) frustasi dengan satu hal: **bahasa yang menyembunyikan perilaku berbahaya di balik sintaks yang ramah**.

### Tiga Penyakit Bahasa Modern
**Penyakit C++**: Exception tersembunyi.
```c++
// C++ — apa yang bisa gagal di sini?
std::vector<int> v;
v.push_back(42);   // bisa throw std::bad_alloc — tapi siapa yang tahu?
auto x = v.at(0);  // bisa throw std::out_of_range — tanpa tanda apa pun
```

Tidak ada penanda visual bahwa kode ini bisa meledak. `push_back` memanggil `new` di balik layar. Ini yang disebut *hidden control flow* — program bisa melompat ke exception handler yang tak terlihat kapan saja.

**Penyakit Go**: Hidden allocation.
```go
// Go — berapa alokasi heap tersembunyi di sini?
s := fmt.Sprintf("hello %s", name)  // alokasi heap — tapi di mana? kapan?
m := map[string]int{"a": 1}         // alokasi heap — implisit dan otomatis
```

**Penyakit Rust**: Kompleksitas kognitif untuk kasus sederhana (walaupun safety-nya unggul).

**Solusi Zig: Eksplisit di Segalanya**
```zig
// Zig 0.16.0 — SETIAP potensi kegagalan ditandai eksplisit
const allocator = std.heap.page_allocator;

// 'try' = "kode ini bisa gagal, dan saya akui itu"
const buffer = try allocator.alloc(u8, 1024);
defer allocator.free(buffer);  // cleanup DIJAMIN dipanggil

// Tidak ada exception. Tidak ada hidden allocation.
// Tidak ada kejutan.
```

### Empat Janji Zig
|Janji                   | Artinya                                                          |
|------------------------|------------------------------------------------------------------|
| No Hidden Control Flow | Setiap try adalah penanda eksplisit bahwa fungsi bisa gagal      |
| No Hidden Allocations  | Memory hanya dialokasikan bila Anda menyebutnya secara eksplisit |
| No Undefined Behavior  | UB dideteksi di Debug mode, bukan diam-diam                      |
| Comptime Over Macros   |Meta-programming tanpa preprocessor gelap                         |

## 2. Toolchain Zig

### Instalasi & Verifkasi
```bash
# Verifikasi versi
zig version
# Output: 0.16.0

# Inisialisasi proyek baru
mkdir belajar-zig && cd belajar-zig
zig init
# Akan membuat: build.zig, build.zig.zon, src/main.zig, src/root.zig
```

### Struktur Proyek

```
belajar-zig/
├── build.zig          ← Build script (pengganti Makefile)
├── build.zig.zon      ← Package manifest (dependencies)
└── src/
    ├── main.zig       ← Entry point executable
    └── root.zig       ← Library root (bila membuat library)
```

`build.zig` di zig 0.16.0

```zig
// build.zig — Zig 0.16.0
// PENTING: Gunakan std.Build, BUKAN std.build.Builder (sudah deprecated!)
const std = @import("std");

pub fn build(b: *std.Build) void {
    // 1. Target: arsitektur + OS yang dituju
    //    null = native (kompilasi untuk mesin saat ini)
    const target = b.standardTargetOptions(.{});

    // 2. Optimize mode: Debug, ReleaseSafe, ReleaseFast, ReleaseSmall
    const optimize = b.standardOptimizeOption(.{});

    // 3. Definisikan executable
    //    b.path() adalah cara BARU untuk menentukan file sumber
    const exe = b.addExecutable(.{
        .name = "belajar-zig",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // 4. Install artifact ke zig-out/bin/
    b.installArtifact(exe);

    // 5. 'zig build run' — shortcut untuk build + jalankan
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Jalankan aplikasi");
    run_step.dependOn(&run_cmd.step);

    // 6. 'zig build test' — jalankan unit tests
    const unit_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Jalankan unit tests");
    test_step.dependOn(&run_unit_tests.step);
}
```

## 3. Sistem Tipe Zig - Dari Primitif ke Kompleks
### Integer: Eksplisit Ukuran dan Sign
Zig tidak memiliki tipe `int` yang ambigu seperti C. Setiap integer harus disebutkan ukurannya:

```zig
// Unsigned integers
const a: u8  = 255;      // 0 — 255
const b: u16 = 65535;    // 0 — 65535
const c: u32 = 4294967295;
const d: u64 = 18446744073709551615;

// Signed integers
const e: i8  = -128;     // -128 — 127
const f: i32 = -2147483648;

// Pointer-sized (bergantung pada target)
const g: usize = 8;      // 8 byte di 64-bit system
const h: isize = -1;

// Arbitrary-width integers! (fitur unik Zig)
const i: u1   = 1;       // hanya 0 atau 1
const j: u7   = 127;     // 7-bit integer
const k: u128 = 0xDEADBEEF_DEADBEEF_DEADBEEF_DEADBEEF;

// comptime integer — tidak terbatas ukurannya, hanya ada saat kompilasi
const big: comptime_int = 9999999999999999999999999999;
```

### Float: Presisi Eksplisit
```zig
const half: f16  = 3.14;      // 16-bit float (untuk ML/GPU)
const single: f32 = 3.14159;  // 32-bit float
const double: f64 = 3.14159265358979; // 64-bit float (paling umum)
const quad: f128  = 3.14159265358979323846; // 128-bit float
```

### Boolean dan Void
```zig
const flag: bool = true;
const nothing: void = {};     // void adalah nilai, bukan ketiadaan tipe

// noreturn — tipe untuk fungsi yang tidak pernah kembali
fn crash() noreturn {
    @panic("sistem crash!");  // tidak pernah return
}
```

### Optional - Alternatif Null yang aman
Di Zig, `null` tidak bisa ditempatkan sembarangan. Hanya `?T` yang boleh null :
```zig
// T biasa: TIDAK BISA null
var x: u32 = 42;
// x = null; // ERROR KOMPILASI! u32 tidak opsional

// ?T (optional): BISA null
var maybe: ?u32 = 42;
maybe = null; // OK

// Mengakses nilai optional — harus di-unwrap dulu
if (maybe) |nilai| {
    // Di sini 'nilai' bertipe u32, bukan ?u32
    std.debug.print("Nilai: {d}\n", .{nilai});
} else {
    std.debug.print("Kosong!\n", .{});
}

// orelse — berikan nilai default bila null
const pasti: u32 = maybe orelse 0;

// .? — unwrap paksa (panic bila null — gunakan dengan hati-hati!)
const paksa: u32 = maybe.?;
```

## 4. Error Handling - Sistem Error
ini adalah salah satu fitur paling elegan di Zig. Error bukan exception, error adalah *nilai*

### Error Set - Mendefinisikan Error

```zig
// Error set sederhana
const FileError = error{
    NotFound,
    PermissionDenied,
    DiskFull,
};

// Error set bisa digabung dengan '||'
const NetworkError = error{
    ConnectionRefused,
    Timeout,
};

// Gabungan
const AppError = FileError || NetworkError;
```

### Error Union - Fungsi yang bisa Gagal
```zig
// Sintaks: 'ErrorSet!ReturnType'
// Bila ErrorSet dihilangkan, Zig akan infer dari semua error yang mungkin
fn bacaFile(path: []const u8, allocator: std.mem.Allocator) ![]u8 {
    const file = try std.fs.cwd().openFile(path, .{});
    defer file.close();

    const size = try file.getEndPos();
    const buffer = try allocator.alloc(u8, size);
    errdefer allocator.free(buffer);  // bebas bila error terjadi SETELAH alokasi

    const bytes_read = try file.readAll(buffer);
    return buffer[0..bytes_read];
}
```

### Tiga Cara Menangani Error
```zig
// CARA 1: try — propagasi ke pemanggil
fn coba(allocator: std.mem.Allocator) !void {
    const data = try bacaFile("config.txt", allocator);
    defer allocator.free(data);
    // bila bacaFile gagal, fungsi ini langsung return dengan error yang sama
}

// CARA 2: catch — tangani inline
fn tangani(allocator: std.mem.Allocator) void {
    const data = bacaFile("config.txt", allocator) catch |err| {
        std.debug.print("Gagal baca file: {}\n", .{err});
        return;
    };
    defer allocator.free(data);
}

// CARA 3: catch dengan nilai default (hanya untuk non-void return)
fn withDefault() u32 {
    const nilai = std.fmt.parseInt(u32, "abc", 10) catch 0;
    return nilai; // mengembalikan 0 bila parsing gagal
}
```

### **errdefer** - Cleanup yang Cerdas
```zig
fn buatKoneksi(allocator: std.mem.Allocator) !*Connection {
    const conn = try allocator.create(Connection);
    // errdefer: HANYA dijalankan bila fungsi return dengan error
    // Berbeda dengan 'defer' yang SELALU dijalankan
    errdefer allocator.destroy(conn);

    try conn.connect("localhost", 8080);
    // Bila connect() gagal → errdefer dijalankan → memory dibebaskan
    // Bila connect() sukses → errdefer TIDAK dijalankan → caller yang bertanggung jawab

    return conn;
}
```

## 5. Comptime - Meta-programming yang Deterministik
**comptime** adalah mekanisme Zig untuk menjalankan kode *saat kompilasi*. Ini menggantikan template C++, macro C, dan generics bahasa modern — dengan cara yang lebih transparan.

### Comptime Expression
```zig
// Evaluasi saat kompilasi, bukan runtime
const fibonacci_10 = comptime blk: {
    var a: u64 = 0;
    var b: u64 = 1;
    var i: u32 = 0;
    while (i < 10) : (i += 1) {
        const tmp = a + b;
        a = b;
        b = tmp;
    }
    break :blk a;
};
// fibonacci_10 adalah konstanta u64 = 55, dihitung saat kompilasi
// Tidak ada overhead runtime!

// @TypeOf — dapatkan tipe dari ekspresi saat comptime
const T = @TypeOf(fibonacci_10); // T = u64

// @typeName — nama tipe sebagai string saat comptime
const nama = @typeName(u32); // "u32"
```

### Comptime Parameter — Generics Zig
```
// 'comptime T: type' membuat fungsi generic
fn maksimum(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

// Dipanggil seperti fungsi biasa, tapi T diisi saat kompilasi
const m1 = maksimum(u32, 10, 20);  // T = u32, return u32
const m2 = maksimum(f64, 3.14, 2.71); // T = f64, return f64

// Compiler membuat DUA versi fungsi yang berbeda (monomorphization)
// Tidak ada overhead runtime untuk type checking
```

---

<div align="center">

    @[Gh0sT4n](https://github.com/gh0st4n) - [T4n OS](https://t4n-labs.github.io/t4n-os) - [Zig 0.16.0](https://ziglang.org/documentation/0.16.0)

    [<- Previously](../../CHANGELOG-API.md) | [Next ->](./02-ImplementasiKode.md)

</div>