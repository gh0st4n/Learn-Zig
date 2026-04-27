const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    var buffer:[100]u8 = undefined;

    std.debug.print("Masukkan Umur Kamu : ", .{});
    const input = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

    if (input) |umur_int| {
        const umur = try std.fmt.parseInt(i32, umur_int, 10);
        std.debug.print("Umur kamu adalah {} umur\n", .{umur});
    } else {
        std.debug.print("Tidak ada inputan\n", .{});
    }
}
