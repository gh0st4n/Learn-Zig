// Float :
// f16  : Float 16-Bit
// f32  : Float 32-Bit
// f64  : Float 64-bit
// f128 : Float 128-bit
// Default di zig adalah tergantung arsitektur laptop user

const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const pi:f32 = 3.14;
    const r_emas:f64 = 1.618;
    const kecepatan_cahaya:f64 = 3.0e8; // 3 x 10^8
    const angka_kecil:f64 = 2.5e-4;  // 2,5 x 10^-4
    const nilai_des = 10_000.00;
    const default = 42.3;
    const nilai_kecil:f16 = 0.0001;
    const nilai_besar:f128 = 1.23e100; // 1,23 x 10^100

    print("Nilai pi : {}\n", .{pi});
    print("Nilai rasio emas : {}\n", .{r_emas});
    print("Nilai Desimal dengan separator : {}\n", .{nilai_des});
    print("Nilai kecepatan_cahaya : {}\n", .{kecepatan_cahaya});
    print("Nilai Kecil = {}\n", .{angka_kecil});
    print("Nilai Default = {}\n", .{default});
    print("Nilai Kecil : {}\n", .{nilai_kecil});
    print("Nilai Besar : {}\n", .{nilai_besar});
}
