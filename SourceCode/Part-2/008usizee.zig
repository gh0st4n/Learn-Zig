const std = @import("std");

const Orang = struct {
    nama:[]const u8,
    umur:u32,
};

pub fn main() !void{
    const ukuran = @sizeOf(Orang);
    std.debug.print("Ukuran dari struct Orang adalah: {d} byte\n", .{ukuran});

    const pjg_str:usize = "Yo what's up".len;
    std.debug.print("Ukuran dari string len adalah: {d}\n", .{pjg_str});

    const angka_besar:usize = 255;
    const ubah_kenilai_kecil:u8 = @intCast(angka_besar);
    std.debug.print("Hasil: {d}\n", .{ubah_kenilai_kecil});

    var nilai_x:isize = 10;
    nilai_x -= 15;
    std.debug.print("Hasil nilai x: {d}\n", .{nilai_x});
}
