const std = @import("std");

pub fn main() !void{
    var array = [_]i32{1, 2, 3, 4, 5};
    const pointer_array:[*]i32 = &array;

    std.debug.print("Pointer dari array: {}\n", .{pointer_array[1]});
}
