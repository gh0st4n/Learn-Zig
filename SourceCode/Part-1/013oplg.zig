//Operator Logika
// Sering Diunakan untuk menentukan nilai Boolean, biasanya digunakan untuk Looping atau Kontrol Alur Program

// Operator Logika ada 3 :
// and -> True jika keduanya sama
// or  -> True jika salah satu keduanya True
// ! (not) -> Membalikan nilai dari nilai boolean(true -> false atau false -> true)

const std = @import("std");
const print = std.debug.print;

pub fn main() void{
    const nilai_a:bool = true;
    const nilai_b:bool = false;
    const nilai_c:bool = true;
    const nilai_d:bool = false;
    print("Nilai a : {}\nNilai b : {}\nNilai c : {}\nNilai d : {}\n\n", .{nilai_a, nilai_b, nilai_c, nilai_d});

    const hasil_1 = nilai_a and nilai_b;
    const hasil_2 = nilai_a and nilai_c;
    print("Hasil Operator Logika and_1 : {}\n", .{hasil_1});
    print("Hasil Operator Logika and_2 : {}\n", .{hasil_2});

    const hasil1 = nilai_a or nilai_b;
    const hasil2 = nilai_b or nilai_d;
    print("Hasil Operator Logika or_1  : {}\n", .{hasil1});
    print("Hasil Operator Logika or_2  : {}\n", .{hasil2});

    const test1 = !nilai_a;
    const test2 = !nilai_b;
    print("Hasil Operator Logika not_1 : {}\n", .{test1});
    print("Hasil Operator Logika not_2 : {}\n", .{test2});
}
