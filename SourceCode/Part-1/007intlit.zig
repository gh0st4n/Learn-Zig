//Integer Literal
const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    // Literal integer desimal (basis 10)
    const desimal: i32 = 98222;

    // Literal integer heksadesimal (basis 16), diawali dengan 0x atau 0X
    const heksa: u8 = 0xff;
    const heksa_besar: u8 = 0xFF;

    // Literal integer oktal (basis 8), diawali dengan 0o
    const oktal: u16 = 0o755;

    // Literal integer biner (basis 2), diawali dengan 0b
    const biner: u8 = 0b11110000;

    // Garis bawah (_) dapat digunakan sebagai pemisah visual
    const satu_miliar: u64 = 1_000_000_000;
    const alamat_besar: u64 = 0xFF80_0000_0000_0000;

    print("Desimal: {}\n", .{desimal});
    print("Heksadesimal: {}\n", .{heksa});
    print("Heksa_desimal: {}", .{heksa_besar});
    print("Oktal: {}\n", .{oktal});
    print("Biner: {}\n", .{biner});
    print("Satu miliar: {}\n", .{satu_miliar});
    print("Alamat Besar: {}\n", .{alamat_besar});
}

