const std = @import("std");

const BentukRuang = enum {lingkaran, persegi, segitiga};
const DataBentuk = union(BentukRuang) {
    lingkaran:struct {jari: f32},
    persegi:struct {sisi: f32},
    segitiga:struct {alas:f32, tinggi:f32},

    pub fn hitung_luas(bentuk:DataBentuk) f32 {
        return switch (bentuk) {
            .lingkaran => |l| 3.14 * l.jari * l.jari,
            .persegi => |s| s.sisi * s.sisi,
            .segitiga => |ls| 0.5 * ls.alas * ls.tinggi,
        };
    }
};

pub fn main() !void{
    const lingkaran = DataBentuk{
        .lingkaran = .{.jari = 6}
    };

    // d:.2 = Hanya memanggil dua angka di belakang koma
    std.debug.print("Luas Keliling Lingkaran: {d:.2}\n", .{lingkaran.hitung_luas()});
}
