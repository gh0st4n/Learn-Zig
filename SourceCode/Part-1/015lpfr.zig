//Loop For
//
//for (iterable) |nilai| {
//.....
//}
//
//- iterable adalah rentang nilai seperti array, slice atau range

const std = @import("std");

pub fn main() void{
    // == For Loop With Array ==
    // const angka = [_]i32{1, 2, 3, 4, 5};  //[_] adalah inisialisasi nilai array
    // for (angka) |angka_kita| {
    //     std.debug.print("{} ", .{angka_kita}); // 1 2 3 4 5
    // }

    // == For Loop Wth Range ==
    // for (1..6) |ar| {
    //     std.debug.print("{} ", .{ar}); // 1 2 3 4 5
    // }

    // == For Loop wth Function(Continue & Break) ==
    // for (1..11) |cb| {
    //     if (cb == 3) {
    //         std.debug.print("Angka 3,Gw Lompati\n", .{});
    //         continue;
    //     } else if (cb == 7) {
    //         std.debug.print("Angka 7,Gw Berhenti\n", .{});
    //         break;
    //     }
    //     std.debug.print("{}\n", .{cb});
    // }

    // == Nestat Looping(Looping dalam Looping)==
    for (1..4) |i| {
        for (1..4) |j| {
            std.debug.print("({} {})", .{i, j});
        }
        std.debug.print("\n", .{});
    }
}
