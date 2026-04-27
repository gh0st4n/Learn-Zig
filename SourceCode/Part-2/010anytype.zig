const std = @import("std");

fn printInfo(nilai: anytype) void {
    const T = @TypeOf(nilai);
    std.debug.print("Nilai: {any}, Tipe Data: {s}\n", .{nilai, @typeName(T)});
}

fn Pangkat(nilai:anytype) @TypeOf(nilai) {
    return nilai * nilai;
}

fn sama(nila_a: anytype, nila_b:@TypeOf(nila_a)) bool {
    return nila_a == nila_b;
}

pub fn main() !void{
    printInfo(42);
    printInfo(3.14);
    printInfo("Gh0sT4n");
    printInfo(.{1, 5, 7, 6, 9});

    std.debug.print("\n", .{});

    const nilai_int = Pangkat(5);
    const nilai_flt= Pangkat(2.5);

    const nilai_intt = sama(10, 10);
    const nilai_char = sama("A", "B");

    std.debug.print("Hasil Pangkat integer: {d}\n", .{nilai_int});
    std.debug.print("Hasil Pangkat Float: {d:.2}\n", .{nilai_flt});

    std.debug.print("Hasil int: {any}\n", .{nilai_intt});
    std.debug.print("Hasil char: {any}\n", .{nilai_char});
}
