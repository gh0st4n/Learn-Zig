//Operator Bitwise
// Kegunaan Bitwise
// 1. Oengelolaan Memori
// 2. Protokol Jaringan
// 3. Algoritma Crypthography

//Jenis-Jenis Operator Bitwise
// &  (Bitwise - AND) : Menghasilkan Nilai 1 jika kedua bit pada posisi tertentu bernilai 1
// |  (Bitwise - OR)
// ^  (Bitwise - XOR) : Menghasilkan Nilai 1 jika kedua bit berbeda
// ~  (Bitwise - NOT) : Akan mengembalikan setiap bit dan mengubah 0 menjadi 1
// << (Bitwise - Left Shifting)  : Mengeser bit ke kiri sebanyak jumlah tertentu dengan mengisi 0 di kanan 
// >> (Bitwise - Right Shifting) : Mengeser bit ke kanan sebanyak jumlah tertentu dengan mengisi 0 di kiri
//
// Example :
// Angka Desimal 6 : 0110
// Angka Desimal 3 : 0011
// Bitwise AND 6 dan 3 : 0010 = 2

//Note :
// - Bitwise hanya mendukung tipe data integer
// - Tipe integer harus sama, jika berbeda harus di konversi

const std = @import("std");
const print = std.debug.print;

pub fn main() void{
    const nilai_a:u8 = 0b1100; // 12
    const nilai_b:u8 = 0b1010; // 10

    const bitwise_and = nilai_a & nilai_b;  // 1100 & 1010 -> 1000 = 8
    print("Hasil Bitwise AND : {}\n", .{bitwise_and});

    const bitwise_or = nilai_a | nilai_b;  // 1100 | 1010 -> 1110 = 14
    print("Nilai Bitwise OR : {}\n", .{bitwise_or});

    const bitwise_xor = nilai_a ^ nilai_b;  // 1100 ^ 1010 -> 0110 = 6
    print("Nilai Bitwise XOR : {}\n", .{bitwise_xor});

    const bitwise_not = ~nilai_a;  // 1100 -> 0011 = 243
    print("Nilai Bitwise NOT : {}\n", .{bitwise_not});

    const bitwise_left = nilai_a << 2;  // 1100 << 2 = 110000 = 48
    print("Nilai Bitwise Left Shifting : {}\n", .{bitwise_left});

    const bitwise_right = nilai_a >> 2;  // 1100 >> 2 = 11 = 3
    print("Nilai Bitwise Right Shifting : {}\n", .{bitwise_right});
}
