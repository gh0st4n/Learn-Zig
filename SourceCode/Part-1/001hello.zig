const std = @import("std");

// pub fn main() void{
//    std.debug.print("Hello World\n", .{});
// }

pub fn main() !void{
    const out = std.io.getStdOut().writer();
    try out.print("Hello World\n", .{});
}

