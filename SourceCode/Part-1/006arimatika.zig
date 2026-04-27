// Operator Penambahan  (+) = a + b
// Operator Pengurangan (-) = a - b
// Operator Perkalian   (*) = a * b
// Operator Pembagian   (/) = a / b
// Operator Sisa Bagi   (%) = a % b

// * = Aisterik
// % = Modulus

const std = @import("std");

pub fn main() void {
    const a:i32 = 10;
    const b:i32 = 3;

    const tambah = a + b;
    const kurang = a - b;
    const kali = a * b;
    const bagi = a / b;
    const sisa = a % b;

    std.debug.print("Nilai a = {}\nNilai b = {}\n", .{a, b});

    std.debug.print("Operator Penambahan  : {}\n", .{tambah});
    std.debug.print("Operator Pengurangan : {}\n", .{kurang});
    std.debug.print("Operator Perkalian   : {}\n", .{kali});
    std.debug.print("Operator Pembagian   : {}\n", .{bagi});
    std.debug.print("Operator Sisa Bagi   : {}\n", .{sisa});
}
