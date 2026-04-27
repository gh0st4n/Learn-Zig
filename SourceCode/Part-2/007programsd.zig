const std = @import("std");

// Struck sebagai Data Paket
// Enum Sebagai Status Pengiriman
// Error Handling Sebagai Pengecekan Error

const ErrorPengiriman = error {
    AlamatKosong,
    BeratInvalid,
    ServerGagal
};

const Status = enum {
    Menunggu,
    Dikirim,
    Terkirim,
    Gagal,
};

const Paket = struct {
    id:u32,
    alamat:[]const u8,
    berat_kg:u16,
    status:Status,

    pub fn update_status(info_data_paket: *Paket, status_baru_paket: Status) void{
        info_data_paket.status = status_baru_paket;
    }
};

fn kirim_paket(paket: *Paket) ErrorPengiriman!void{
    if (paket.alamat.len == 0) {
        paket.update_status(.Gagal);
        return ErrorPengiriman.AlamatKosong;
    }

    if (paket.berat_kg == 0) {
        paket.update_status(.Gagal);
        return ErrorPengiriman.BeratInvalid;
    }

    if (std.crypto.random.int(u8) % 10 == 0) {
        paket.update_status(.Gagal);
        return ErrorPengiriman.ServerGagal;
    }

    paket.update_status(.Terkirim);
}

pub fn main() !void{
    var paket = Paket{
        .id = 1201,
        .alamat = "Jl.Sikece",
        .berat_kg = 6,
        .status = .Menunggu,
    };
    
    std.debug.print("=== INFORMASI PAKET ===\n", .{});
    std.debug.print("- ID: {d}\n", .{paket.id});
    std.debug.print("- Alamat: {s}\n", .{paket.alamat});
    std.debug.print("- Berat: {d} kg\n", .{paket.berat_kg});

    paket.update_status(.Gagal);

    kirim_paket(&paket) catch |err| {
        std.debug.print("- Status ID({d}): {s}\n", .{paket.id, @errorName(err)});
        return;
    };

    paket.update_status(.Gagal);

    switch (paket.status) {
        .Terkirim => std.debug.print("- Paket id {d} terkirim ke alamat {s}\n", .{paket.id, paket.alamat}),
        .Gagal => std.debug.print("- Paket id {d} gagal terkirim ke alamat {s}\n", .{paket.id, paket.alamat}),
        else => unreachable,
    }
}
