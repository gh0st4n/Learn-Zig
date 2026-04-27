const std = @import("std");

const SetError = error {
    AlamatSalah,
    PaketHilang,
    KurirBerduel,
    ServerDown,
    PendekKali,
};

fn kirim_paket(alamat:[]const u8)  SetError!void {
    if (alamat.len == 0) {
        return SetError.AlamatSalah;
    }

    if (alamat.len == 1) {
        return SetError.PendekKali;
    }

    std.debug.print("Paket akan di kirim ke alamat: {s}\n", .{alamat});
}

pub fn main() !void{
    kirim_paket("Jl.Bocah No.245") catch |err| {
        std.debug.print("Gagal kirim paket ke {s}\n", .{@errorName(err)});
        return;
    };

    kirim_paket("i") catch |err| {
        std.debug.print("Gagal kirim paket, Nama Error: {s}\n", .{@errorName(err)});
        return;
    };

    kirim_paket("") catch |err| {
        std.debug.print("Gagal kirim paket, Nama Error: {s}\n", .{@errorName(err)});
        return;
    };
}
