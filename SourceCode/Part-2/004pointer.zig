const std = @import("std");

pub fn main() !void{
    var angka:i32 = 40;
    const alammat_angka: *i32 = &angka;

    std.debug.print("Nilai Pointer dari Si Angka adalah: {d}\n", .{alammat_angka.*});


    alammat_angka.* = 100;
    std.debug.print("Nilai Sekarang dari 40 adalah: {d}\n", .{angka});
}
