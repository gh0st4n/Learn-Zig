//Tyepe Casting (Convert Value)
//
// @as(mengubah_nilai, nilai_yang_ingin_diubah)

const std = @import("std");

pub fn main() void {
    const angka_integer:i32 = 42;
    const angka_float:f32 = @as(f32, angka_integer);

    const nilai_float:f32 = 3.14;
    const nilai_int:i32 = @as(i32, @intFromFloat(nilai_float));

    const nilai_int_32:i32 = 80;
    const tyct_int_8:u8 = @intCast(nilai_int_32);  // Type Casting integer 32-Bit > 8-Bit
    // @floatCast() Type Casting Float 

    std.debug.print("Nilai integer adalah = {}\n", .{angka_integer});
    std.debug.print("Nilai float dari integer adalah : {}\n", .{angka_float});

    std.debug.print("Nilai float adalah : {}\n", .{nilai_float});
    std.debug.print("Nilai integer dari float adalah : {}\n", .{nilai_int});

    std.debug.print("Nilai Awal 32-Bit adalah : {}\n", .{nilai_int_32});
    std.debug.print("Hasil Type Casting 32 > 8 adalah : {}", .{tyct_int_8});
}
