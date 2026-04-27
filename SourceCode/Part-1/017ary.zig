// Array
//
// const nama_array:[ukuran]tipe_data = [ukuran]tipe_data{1, 2, 3, 4, 5}

const std = @import("std");

pub fn main() void{
    // const anka:[5]i32 = [5]i32{1, 2, 3, 4, 5};
    //
    // for (anka) |oo| {
    //     std.debug.print("{}\n", .{oo});
    // }
    

    // const angka:[5]i32 = [5]i32{10, 20, 30, 40, 50};
    //
    // std.debug.print("Element Pertama : {}\n", .{angka[0]});
    // std.debug.print("Element Ketiga  : {}\n", .{angka[2]});


    // var nn:[5]i32 = [5]i32{1, 2, 3, 4, 5};
    // nn[2] = 20;
    //
    // for (nn) |nnn| {
    //     std.debug.print("{}\n", .{nnn});
    // }
    

    //=== Multi Dimensi ===
    //Note :
    //  [jumlah kolom][jumlah baris dalam kolom]nilai bit
    //  contoh : [2][3]i32
    //           [2] = Jumlah kolom
    //           [3] = Jumlah baris
    //           i32 = Nilai Bit
    // 
    //
    // const matriks:[2][3]i32 = [2][3]i32{
    //     [3]i32{1, 2, 3},
    //     [3]i32{4, 4, 6},
    // };
    //
    // for (matriks) |baris| {
    //     for (baris) |element| {
    //         std.debug.print("{} ", .{element});
    //     }
    //     std.debug.print("\n", .{});
    // }
    //
    // const mat:[4][5]i32 = [4][5]i32{
    //     [5]i32{1, 2, 3, 4, 5},
    //     [5]i32{6, 7, 8, 9, 0},
    //     [5]i32{0, 9, 8, 7, 6},
    //     [5]i32{5, 4, 3, 2, 1},
    // };
    //
    // for (mat) |line| {
    //     for (line) |val| {
    //         std.debug.print("{}", .{val});
    //     }
    //     std.debug.print("\n", .{});
    // }

    // == Slice ==
    const i = [_]i32{1,2,3,4,5};
    const sl = i[1..4];

    for (sl) |ii| {
        std.debug.print("{} ", .{ii});
    }
}
