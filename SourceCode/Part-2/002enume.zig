const std = @import("std");

const MenuMakanan = enum {Rendang, Soto, NasiGoreng, MieAceh};
const StatusWeb = enum (u16) {
    StatusOk = 200,
    StatusNotFound = 404,
    ServerError = 500,
};

pub fn main() !void {
    const menu_makanan = MenuMakanan.MieAceh;
    const statusweb = StatusWeb.StatusNotFound;

    std.debug.print("Menu Makanan yang kamu pilih: {s}\n", .{@tagName(menu_makanan)});
    std.debug.print("Status Website adalah: {}\n", .{@intFromEnum(statusweb)});
    //Jika tidak menggunakan @intFromEnum output yang dikeluarkan namafile.StatusWeb.statusweb
}
