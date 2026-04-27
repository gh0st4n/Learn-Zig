const std = @import("std");
const ll = @import("import-file/modules.zig");

pub fn main() void{
    const hasil = ll.pertambahan(10, 20);
    std.debug.print("Hasil: {d}\n", .{hasil});
    std.debug.print("Hasil nilai const-pi: {d:.2}\n", .{ll.Nilai_PI});

    std.debug.print("{s}", .{ll.pp()});
}
