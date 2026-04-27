const std = @import("std");

const Orang = struct {
    umur:u8,
    dewasa:bool,
    nik:u32,
};

pub fn main() !void{
    const size_i32 = @sizeOf(i32);
    const size_u8 = @sizeOf(u8);
    const size_f64 = @sizeOf(f64);

    std.debug.print("Ukuran i32: {d} byte\n", .{size_i32});
    std.debug.print("Ukuran u8: {d} byte\n", .{size_u8});
    std.debug.print("Ukuran f64: {d} byte\n", .{size_f64});

    const ukuran_orang = @sizeOf(Orang);
    std.debug.print("Ukuran struct orang: {d} byte\n", .{ukuran_orang});

    const alakator = std.heap.page_allocator;
    const ukuran_element = @sizeOf(u32);
    const total = ukuran_element * 10;

    const buffer = try alakator.alloc(u8, total);
    defer alakator.free(buffer);

    std.debug.print("Alokasi {d} byte sukses\n", .{total});
}
