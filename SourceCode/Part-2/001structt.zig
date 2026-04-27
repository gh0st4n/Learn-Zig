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
    pelajar:bool = false,  // Membuat default nilai menjadi false

    pub fn view_info(orang:Orang) void{
        std.debug.print("Nama    : {s}\nUmur    : {} Tahun\nAlamat  : {s}\nPelajar : {}", .{orang.nama, orang.umur, orang.alamat.jalan, orang.pelajar});
    }
};

pub fn main() !void {
    const data_orang = Orang{
        .nama = "Gh0sT4n",
        .umur = 17,
        .alamat = AlamatRumah{
            .jalan = "JL.Lucky Masih Kecil",
            .kota = "Kota.Bocil Kematian",
            .kode_pos = "24187",
        },
        .pelajar = true,
    };

    Orang.view_info(data_orang);
}
