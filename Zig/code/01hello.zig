// Hello World
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Halo, dunia!\n", .{});
}

// Hello World adalah program yang terkenal untuk pemula