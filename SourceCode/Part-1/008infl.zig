const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    // 1. Desimal Biasa (Paling sering dipakai)
    // Zig otomatis menganggap ini sebagai float (comptime_float)
    const pi = 3.14159; 
    
    // 2. Notasi Ilmiah (Scientific Notation)
    // Berguna untuk angka yang sangat besar atau sangat kecil
    // 1.5e2 artinya 1.5 dikali 10 pangkat 2 (150.0)
    const tegangan = 1.5e2; 
    
    // 3. Menggunakan Pemisah (Underscore)
    // Agar angka mudah dibaca mata manusia, nilainya tetap sama
    const harga = 1_000_000.50; 

    // 4. Hexadecimal Float (Jarang dipakai di dasar, tapi ada)
    // Menggunakan prefix 0x
    const hex_float = 0x1.2p3; 

    // Menampilkan hasil
    try stdout.print("Nilai PI: {d}\n", .{pi});
    try stdout.print("Tegangan: {d}\n", .{tegangan});
    try stdout.print("Harga: {d}\n", .{harga});
    try stdout.print("Hex Float: {d}\n", .{hex_float});
}
