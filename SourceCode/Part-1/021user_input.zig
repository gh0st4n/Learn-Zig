const std = @import("std");

pub fn main() !void{
    const stdin = std.io.getStdIn().reader();
    var buffer:[100]u8 = undefined;

    std.debug.print("Masukkan Sesuatu : ", .{});
    const input = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

    if (input) |value| {
        std.debug.print("{s}\n", .{value});
    } else {
        std.debug.print("Tidak ada input\n", .{});
    }
}
