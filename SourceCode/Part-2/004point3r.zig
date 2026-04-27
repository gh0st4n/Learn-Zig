const std = @import("std");

const Orang = struct {
    nama:[]const u8,
    umur:u8,
};

pub fn main() !void{
    var cakra = Orang{
        .nama = "Cakra",
        .umur = 17,
    };
    const pointer_cakra: *Orang = &cakra;

    std.debug.print("- Info 2024\nNama: {s}\nUmur: {d}\n", .{pointer_cakra.nama, pointer_cakra.umur});

    pointer_cakra.umur = 20;
    std.debug.print("- Info 2025\nNama: {s}\nUmur: {d}\n", .{pointer_cakra.nama, pointer_cakra.umur});
}
