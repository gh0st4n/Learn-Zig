const std = @import("std");

const AlamatRumah = struct {
    jalan:[]const u8,
    kota:[]const u8,
    kode_pos:[]const u8,
};

const Orang = struct {
    nama:[]const u8,
    umur:u8,
    alamat: AlamatRumah,
    pelajar:bool = false,  //Membuat nilai nya secara defaukt dengan nilai false
};

pub fn main() !void {
    const orang = Orang{
        .nama = "Gh0sT4n",
        .umur = 17,
        .alamat = AlamatRumah{
            .jalan = "JL.Lucky Masih Kecil",
            .kota = "Kota.Bocil Kematian",
            .kode_pos = "24187",
        },
        .pelajar = true,
    };

    std.debug.print("Nama Pelajar: {s}\nUmur: {} Tahun\n", .{orang.nama, orang.umur});
    std.debug.print("Alamat {s} :\n  - Jalan: {s}\n  - Kota: {s}\n  - Kode Pos: {s}\n", .{orang.nama, orang.alamat.jalan, orang.alamat.kota, orang.alamat.kode_pos});

}
