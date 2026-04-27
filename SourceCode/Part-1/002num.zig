const std = @import("std");
const print = std.debug.print;

pub fn main() void{
    const nilai_u8: u8 = 255;
    const nilia_i8: i8 = -100;
    print("Nilai u8 = {}\n", .{nilai_u8});
    print("Nilai i8 = {}\n", .{nilia_i8});
    //u16
    //i16
    //u32  : 429967231
    //i32
    //u64
    //i64
    //u128
    //i128

    // Floating Value
    
    // f16
    // f32
    // f64
    // f128
    const pi:f32 = 3.14159;
    const r_emas:f64 = 1.61803398875;
    print("Nilai Pi : {}\n", .{pi});
    print("Nilai Rasio Emas : {}\n", .{r_emas});

    // usize & isize
    // usize = unsigned yang disesuaikan dengan arsitektur developer
    // isize = signed yang disesuaikan dengan arsitektur developer
    const nilai_u:usize = 1024;
    const nilai_i:isize = -30;
    // Nilai ini akan berubah menjadi 64bit karena di laptop gw(x86_64)
    // dan akan berubah 32bit jika berada di arsitektur 32bit
    print("Nilai usize(unsigned) : {}\n", .{nilai_u});
    print("Nilai isize(signed) : {}\n", .{nilai_i});
}
