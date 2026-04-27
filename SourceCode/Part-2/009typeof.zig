// var x = 10
// @TypeOf(10 + 5.5) -> f64

const std = @import("std");

fn tambahin(nilai_a:anytype, b:@TypeOf(nilai_a)) @TypeOf(nilai_a) {
    return nilai_a + b;
}

const Mobil = struct {
    merek:[]const u8,
    tahun:u16,
};

fn BuatMobil(comptime T: type, data: T) Mobil{
    return .{
        .merek = data.merek,
        .tahun = data.tahun,
    };
}

pub fn main() !void{
    const angka = 42;
    const teks = "arfy";

    const tipe_angka = @TypeOf(angka);
    const tipe_teks = @TypeOf(teks);

    std.debug.print("tipe data dari `angka`: {s}\n", .{@typeName(tipe_angka)});
    std.debug.print("tipe data dari `teks`: {s}\n", .{@typeName(tipe_teks)});

    const hasil_pertama = tambahin(10, 20);  // => i32
    const hasil_kedua = tambahin(5.5, 3.2);
    std.debug.print("Hasil dari `hasil_pertama`: {d}\n", .{hasil_pertama});
    std.debug.print("Hasil dari `hasil_kedua`: {d:.2}\n", .{hasil_kedua});

    const data = .{
        .merek = "Kia Stinger",
        .tahun = 2023,
    };

    const mobil = BuatMobil(@TypeOf(data), data);
    std.debug.print("Mobil: {s} ({d})\n", .{mobil.merek, mobil.tahun});
}
