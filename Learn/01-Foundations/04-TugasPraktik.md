# Tugas Praktik

## Level 1 - Pemula : "Hello Zig"
Buat program yang mencetak tabel perkalian 1–10 menggunakan nested loop. Program harus menggunakan `stdout.print` (bukan `std.debug.print`) dan format output harus rata kanan dengan lebar 4 karakter per sel.
Output yang diharapkan:

```text
1   2   3  ...  10
   2   4   6  ...  20
...
  10  20  30  ... 100
```
Hint: gunakan `{d:>4}` sebagai format specifier untuk rata kanan lebar 4.

## Level 2 - Menengah Bawah: "FizzBuzz dengan Error Handling"
Buat fungsi `fizzBuzz(n: u32, writer: anytype) !void` yang:

1. Mencetak "Fizz" bila n habis dibagi 3
2. Mencetak "Buzz" bila n habis dibagi 5
3. Mencetak "FizzBuzz" bila habis dibagi keduanya
4. Mencetak angkanya sendiri bila tidak ada keduanya
5. Mengembalikan error.InvalidInput bila n == 0

Panggil dari `main` dengan error handling menggunakan `catch`.

## Level 3 - Menengah: "Stack Kalkulator"
Implementasikan kalkulator RPN (Reverse Polish Notation) menggunakan `Stack(f64)` dari Bagian 6. Program harus:

1. Membaca input seperti `"3 4 + 2 * 7 -"` (hasilnya: `(3+4)*2-7 = 7`)
2. Tokenize berdasarkan spasi menggunakan `std.mem.splitScalar`
3. Bila token adalah angka → push ke stack
4. Bila token adalah operator (+, -, *, /) → pop dua angka, hitung, push hasilnya
5. Return error bila input invalid (stack underflow, division by zero)

## Level 4 - Lanjutan: "Custom String Formatter"
Buat fungsi `formatBytes(bytes: u64, writer: anytype) !void` yang mengonversi bytes ke format human-readable:
```text
0       → "0 B"
1023    → "1023 B"
1024    → "1.00 KiB"
1536    → "1.50 KiB"
1048576 → "1.00 MiB"
```
Syarat tambahan:

- Gunakan `comptime` untuk mendefinisikan tabel unit `[_]struct { name: []const u8, value: u64 }{...}`
- Gunakan `@as(f64, ...)` untuk konversi integer ke float
- Tulis minimal 5 unit test menggunakan `std.testing.expectEqualStrings`

## Level 5 - Sepuh: "Config Parser dengan Comptime Validation"
Buat sistem konfigurasi yang:

1. Mendefinisikan `ConfigSchema` menggunakan comptime struct yang mendeskripsi field-field config:


```zig
const schema = [_]FieldDef{
       .{ .name = "port", .type = .uint16, .default = "8080", .min = 1, .max = 65535 },
       .{ .name = "workers", .type = .uint8, .default = "4", .min = 1, .max = 64 },
       .{ .name = "log_level", .type = .string, .options = &.{"debug","info","warn","error"} },
   };
```

2. Fungsi `parseConfig(comptime schema: []const FieldDef, data: []const u8, allocator) !Config` yang:

- Memvalidasi tipe dan range setiap nilai
- Menggunakan `errdefer` untuk cleanup yang tepat
- Memberikan error message yang informatif


3. Setidaknya 8 unit test yang mencakup kasus boundary, invalid input, dan default values.


---

<div align="center">
  <a href="https://github.com/gh0st4n">Gh0sT4n</a> -
  <a href="https://t4n-labs.github.io/t4n-os">T4n OS</a> -
  <a href="https://ziglang.org/documentation/0.16.0">Zig 0.16.0</a>

  <br><br>

  <a href="./03-VisualisasiMemori.md">&lt;- Previously</a> |
  <a href="./05-Note.md">Next -&gt;</a>
</div>