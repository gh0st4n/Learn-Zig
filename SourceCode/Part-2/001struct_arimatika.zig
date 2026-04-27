const std = @import("std");

const Hitung = struct {
    panjang:u32,
    lebar:u32,

    pub fn hasil(nilai:Hitung) u32 {
        return nilai.panjang * nilai.lebar;
    }
};

pub fn main() !void{
    const val = Hitung{
        .panjang = 100,
        .lebar = 50,
    };

    std.debug.print("Hasil Panjang(100) x Lebar(50) adalah: {}m", .{Hitung.hasil(val)});
}
