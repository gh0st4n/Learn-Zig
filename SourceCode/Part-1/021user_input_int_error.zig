const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    var buffer:[100]u8 = undefined;

    std.debug.print("Masukkan Umur Kamu : ", .{});
    const input = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

    if (input) |angka_str| {
        const angka = try std.fmt.parseInt(i32, angka_str, 10) catch |err| {
            std.debug.print("input tidak valid {}\n", .{err});
            return;
        };
        std.debug.print("Angka yang kamu masukkan {}\n", .{angka});
    } else {
        std.debug.print("Tidak ada inputan\n", .{});
    }
}
