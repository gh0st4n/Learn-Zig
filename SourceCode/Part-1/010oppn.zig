//Operator Penugasan
// =   (Default)
// +=  (Arimatika)
// -=  (Arimatika)
// *=  (Arimatika)
// /=  (Arimatika)
// %=  (Arimatika)

const std = @import("std");
const print = std.debug.print;

pub fn main() void{
    var nilai:i32 = 10;
    var nilaif:f32 = 20.5;
    const nilai_pi = 3.14159;
    print("Nilai sebelumnya : {}\n", .{nilai});
    print("Nilai Float sebelumnya : {}\n", .{nilaif});
    print("Nilai Pi sebelumnya : {}\n", .{nilai_pi});

    nilai = 30;
    print("Nilai dari = adalah : {}\n", .{nilai});

    nilai += 10; // -= , *= , /= , %=
    nilaif += 20.46;
    print("Nilai dari '+=' adalah : {}\n", .{nilai});
    print("Nilai Float dari '+=' adalah : {}\n", .{nilaif});

    const returnn = nilai_pi * 3 * 3;
    print("Nilai Pi dari nilai_pi * 3 * 3 : {}\n", .{returnn});
}
