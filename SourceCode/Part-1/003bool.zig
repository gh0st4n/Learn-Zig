const std = @import("std");

pub fn main() void{
    const nilai:bool = true; // atau false
    std.debug.print("nilai : {}\n", .{nilai});
    std.debug.print("nilai selanjutnya : {}\n", .{false});
}
