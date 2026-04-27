const std = @import("std");

pub fn main() !void{
    const buah = [_][]const u8 {"Apel", "Rambutan", "Mangga", "Jeruk", "Semanggka"};

    for (buah, 0..) |buaah, index| {
        std.debug.print("Buah ke {d}: {s}\n", .{index, buaah});
    }
}
