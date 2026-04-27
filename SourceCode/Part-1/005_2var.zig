const std = @import("std");

pub fn main() void{
    var nama:[]const u8 = "Gh0sT4n";
    std.debug.print("Nama nilai Var pertama : {s}\n", .{nama});
    nama = "Zig";
    std.debug.print("Nama nilai Var kedua : {s}\n", .{nama});
}
