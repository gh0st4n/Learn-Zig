//Operator Perbandingan
// == --> a == b (True/False)
// != --> a != b (True/False)
// <  --> a < b  (True/False)
// >  --> a > b  (True/False)
// <= --> a <= b (True/False)
// >= --> a >= b (True/False)

const std = @import("std");
const print = std.debug.print;

pub fn main() void{
    const a:i32 = 42;
    const b:i32 = 100;

    const prsmaan = a == b;
    const tdksama = a != b;
    const kecildr = a < b;
    const besardr = a > b;
    const lekecsr = a <= b;
    const lebessr = a >= b;

    print("Apakah a & b sama ? {}\n", .{prsmaan});
    print("Apakah a & b tidak sama ? {}\n", .{tdksama});
    print("Apakah a kecil dari b ? {}\n", .{kecildr});
    print("Apakah a besar dari b ? {}\n", .{besardr});
    print("Apakah a lebih kecil dari b ? {}\n", .{lekecsr});
    print("Apakah a lebih besar dari b ? {}\n", .{lebessr});

    const nilai_x:f32 = 3.14;
    const nilai_y:f32 = 4.15;

    print("Apakah nilai x lebih besar dari nilai y ? {}", .{nilai_x > nilai_y});
}
