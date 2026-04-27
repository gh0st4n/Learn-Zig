const std = @import("std");

const StatusPesanan = enum {
    Draf,
    Dikirim,
    Diterima,
    Dibatalkan,

    pub fn bisa_berubah(pesanan:StatusPesanan) bool {
        return switch (pesanan) {
            .Draf, .Dikirim => true,
            .Diterima, .Dibatalkan => false,
        };
    }
};

pub fn main() !void{
    const pesanan = StatusPesanan.Dikirim;

    if (pesanan.bisa_berubah()) {
        std.debug.print("pesanan masih bisa diubah\n", .{});
    } else {
        std.debug.print("pesanan sudah tidak bisa diubah", .{});
    }
}
