const std = @import("std");

pub fn main() void {
    const nama:[]const u8 = "Gh0sT4n";
    std.debug.print("Nama Lu dengan Variabel const : {s}", .{nama});
}
