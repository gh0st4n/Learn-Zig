const std = @import("std");

pub fn main() void{
    const nama:[]const u8 = "Gh0sT4n";
    const namat:[]const u8 = "Walawe";
    const cha = nama[0];
    const cha1 = nama[3];
    std.debug.print("Nama Saya adalah: {s} Kece dan {s}\n", .{nama, namat});
    std.debug.print("Elemen pertama = {c}\n", .{cha});
    std.debug.print("Elemen keempat = {c}\n", .{cha1});
}
