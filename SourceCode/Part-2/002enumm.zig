const std = @import("std");

const Arah = enum {
    Utara,
    Selatan,
    Timur,
    Barat,

    pub fn kebalikan(arah:Arah) Arah {
        return switch (arah) {
            .Utara => .Selatan,
            .Selatan => .Utara,
            .Timur => .Barat,
            .Barat => .Timur,
        };
    }
};

pub fn main() !void{
    const arah = Arah.Timur;
    std.debug.print("Arah kebalikan dari Timur adalah: {s}\n", .{@tagName(arah.kebalikan())});
}
