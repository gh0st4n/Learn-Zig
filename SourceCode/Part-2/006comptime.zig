const std = @import("std");

fn valid_genap(comptime nilai:i32) !void{
    if (nilai % 2 != 0) {
        return error.TidakGenap;
    }
}

pub fn main() !void{
    comptime {
        try valid_genap(4);
    }
    std.debug.print("Validasi nilai berhasil\n", .{});
}
