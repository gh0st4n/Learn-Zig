// Switch Case
//
// Contoh Penulisa Kode :
//
// switch (ekspresi) {
//  nilai => {
//      .......
//  },
//  nilai1 => {},
//  else => {},
// }
const std = @import("std");

pub fn main() void {
    // === Standard Switch ===
    // const hari = 3;
    //
    // switch (hari) {
    //     1 => std.debug.print("ini adalah hari Senin\n", .{}),
    //     2 => std.debug.print("ini adalah hari Selasa\n", .{}),
    //     3 => std.debug.print("ini adalah hari Rabu\n", .{}),
    //     4 => std.debug.print("ini adalah hari Kamis\n", .{}),
    //     else => std.debug.print("Nomor Hari tidak Valid\n", .{}),
    // }
    
    // === Multi-Value ===
    // const bulan = 2;
    //
    // switch (bulan) {
    //     1, 3, 5, 7, 8, 10, 12 => std.debug.print("Bulan ini memiliki 31 Hari\n", .{}),
    //     4, 6, 9, 11 => std.debug.print("Bulan ini memiliki 30 Hari\n", .{}),
    //     2 => std.debug.print("Bulan ini memiliki 28/29 Hari\n", .{}),
    //     else => std.debug.print("Nomor Bulan tidak Valid", .{}),
    // }

    // === Range ====
    const nilai = 90;

    switch (nilai) {
        90...100 => std.debug.print("Nilai Kamu A\n", .{}),
        80...89 => std.debug.print("Nilai Kamu B\n", .{}),
        70...79 => std.debug.print("Nilai Kamu C\n", .{}),
        60...69 => std.debug.print("Nilai Kamu D\n", .{}),
        0...59 => std.debug.print("NT Bang\n", .{}),
        else => std.debug.print("Nilai Tidak Valid\n", .{}),
    }
}
