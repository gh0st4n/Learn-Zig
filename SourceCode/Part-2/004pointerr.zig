const std = @import("std");

pub fn main() !void {
    const pointer_kosong: ?*i32 = null;

    if (pointer_kosong == null) {
        std.debug.print("Pointer ini memang kosong\n", .{});
    } else {
        std.debug.print("Pointer ini ada nilai\n", .{});
    }
}
