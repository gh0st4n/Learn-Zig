const std = @import("std");

const Data = union{
    int:i32,
    float:f32,
    string:[]const u8,
};

pub fn main() void{
    const data_pertama = Data{
        .int = 60
    };
    const data_kedua = Data{
        .string = "Woi Belajar, Jangan Pantang Menyerah"
    };

    std.debug.print("nilai integer dari union adalah: {}\n", .{data_pertama.int});
    std.debug.print("Pesan: {s}\n", .{data_kedua.string});
}
