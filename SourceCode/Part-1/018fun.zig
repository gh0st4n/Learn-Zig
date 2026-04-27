//Function
//
//Contoh Penulisan Function di Zig
//
//fn nama_fungsi(parameter:tipe_data) tipe_kembalian {
//......
//}
const std = @import("std");

fn tambah(nilai_a:i32, nilai_b:i32) i32 {
    return nilai_a + nilai_b;
}


// Tanpa parameter/tipe kembalian
fn panggil_saya(nama:[]const u8) void {
    std.debug.print("Halo {s}, Selamat Pagi\n", .{nama});
}

fn panggil_orang(nama:[]const u8, pesan:[]const u8) void {
    std.debug.print("{s} : {s}\n", .{nama, pesan});
}

fn menghitung(a:i32, b:i32) struct {hasil:i32, selisih:i32} {
    return .{
        .hasil = a + b,
        .selisih = a - b,
    };
}

fn faktorial(nilai:i32) i32 {
    if (nilai == 0) {
        return 1;
    }
    return nilai * faktorial(nilai - 1);
}

pub fn main() void {
    const hasil = tambah(5, 3);
    const hitung_hasil = menghitung(10, 4);
    const nilai_rekrusif = faktorial(5);

    panggil_saya("Gh0sT4n");
    panggil_orang("Andi", "Woi Sehat Lu ?");
    panggil_orang("Gh0sT4n", "Sehat GW");

    std.debug.print("\n", .{});
    std.debug.print("Hasil = {}\n", .{hasil});
    std.debug.print("jumlah {}, dan Selisih {}\n", .{hitung_hasil.hasil, hitung_hasil.selisih});
    std.debug.print("Faktorial dari 5 adalah {}", .{nilai_rekrusif});
}
