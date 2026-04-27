//Looping While
//
//while (kondisi) {
//....
//}

const std = @import("std");

pub fn main() void{
    // == Basic While ==
    // var i:i32 = 1;
    //
    // while (i <= 5) {
    //     std.debug.print("Nilai iterasi : {}\n", .{i});
    //     i += 1;
    // }
    

    // == While(Unlimited Loop) dengan fungsi break ==
    // var i:i32 = 1;
    //
    // while(true) {
    //     std.debug.print("{}\n", .{i});
    //     i += 1;
    //
    //     if (i > 1001) {
    //         break;
    //     }
    // }


    // == While dengan function continue ==
    // var i:i32 = 0;
    // while (i < 15) {
    //     i += 1;
    //     if (i == 4) {
    //         continue;
    //     }
    //     std.debug.print("{}\n", .{i});
    // }
    

    // == While Netstat ==
    var i:i32 = 1;
    while(i <= 3) {
        var j:i32 = 1;
        while (j <= 3) {
            std.debug.print("({}, {})", .{i, j});
            j += 1;
        }
        std.debug.print("\n", .{});
        i += 1;
    }
}
