// if statement
// example
// if (kondisi) {
// ..........
// }
const std = @import("std");
const print = std.debug.print;

pub fn main() void{
    // const angka = 27;
    //
    // if (angka % 2 == 0) {
    //     print("angka {} adalah bilangan genap\n", .{angka});
    // } else {
    //     print("angka {} adalah bilangan ganjil\n", .{angka});
    // }
    const angka = 10;
    const hasil = if (angka % 2 == 0) "Genap" else "Ganjil";

    print("{} adalah Bilangan {s}\n\n", .{angka, hasil});

    const nilai = 60;

    if (nilai >= 90) {
        print("Nilai Kamu A dengan score {}\n", .{nilai});
    } else if (nilai >= 80) {
        print("Nilai Kamu B dengan score {}\n", .{nilai});
    } else if (nilai >= 70) {
        print("Nilai Kamu C dengan score {}\n", .{nilai});
    } else {
        print("NT Bang, Nilai {}\n", .{nilai});
    }
}
