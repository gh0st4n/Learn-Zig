# Implementasi Kode: Dari Hello World ke Error System Nyata

## Part 1 : Hello World

```zig
// src/main.zig - Versi Paling Sederhana
const std = @import("std");

pub fn main() void {
    std.debug.print("Halo, Zig 0.16.0". .{});
}
```

```zig
// src/main.zig - versi proper dengan explicit I/O
const std = @import("std");

pub fn main() !void{
    // Ambil stdout writter secara eksplisit
    const stdout = std.io
}
```

Tapi ini terlalu sederhana. Versi proper yang menggunakan stdout dengan error handling:

```zig
// src/main.zig — versi proper dengan explicit I/O
const std = @import("std");

pub fn main() !void {
    // Ambil stdout writer secara eksplisit
    const stdout = std.io.getStdOut().writer();

    // 'try' karena write() bisa gagal (disk penuh, broken pipe, dll)
    try stdout.print("Halo, Zig {s}!\n", .{"0.16.0"});

    // Format strings di Zig:
    // {s}  = string ([]const u8)
    // {d}  = integer desimal
    // {x}  = hexadecimal
    // {b}  = binary
    // {f}  = float
    // {}   = default format
    // {any} = format apapun (untuk debugging)

    const angka: u32 = 42;
    const pecahan: f64 = 3.14159;
    try stdout.print("Angka: {d}, Hex: 0x{X:0>8}, Float: {d:.3}\n", .{
        angka,
        angka,
        pecahan,
    });
}
```

## Part 2 : Variabel, Konstanta & Tipe

```zig
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    // 'const' — immutable, harus diinisialisasi saat deklarasi
    const pi: f64 = 3.14159265358979;
    const max_users: u32 = 1000;

    // 'var' — mutable
    var counter: u32 = 0;
    counter += 1;
    counter += 1;

    // Type inference dengan '_' suffix
    // Zig JARANG melakukan type inference pada deklarasi
    // Tapi bisa dengan @as() atau dari context
    const inferred = @as(u64, 42); // eksplisit cast ke u64

    // Undefined — nilai belum diinisialisasi
    // HANYA gunakan bila Anda AKAN mengisinya sebelum dibaca
    var buffer: [1024]u8 = undefined;
    buffer[0] = 'H';
    buffer[1] = 'i';

    // Integer literals bisa menggunakan underscore sebagai separator
    const million: u64 = 1_000_000;
    const hex_val: u32 = 0xFF_AA_BB_CC;
    const bin_val: u8  = 0b1010_1010;
    const oct_val: u8  = 0o777;

    try stdout.print("Counter: {d}, Million: {d}\n", .{counter, million});
    _ = pi; // suppress "unused variable" warning
    _ = max_users;
    _ = inferred;
    _ = hex_val;
    _ = bin_val;
    _ = oct_val;
}
```

## Part 3 : Control Flow yang Transparan

```zig
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    // IF — bisa jadi expression!
    const x: i32 = 10;
    const label = if (x > 0) "positif" else if (x < 0) "negatif" else "nol";
    try stdout.print("x adalah {s}\n", .{label});

    // WHILE dengan continue expression
    var i: u32 = 0;
    while (i < 5) : (i += 1) {
        if (i == 3) continue; // skip 3
        try stdout.print("{d} ", .{i});
    }
    try stdout.print("\n", .{});

    // FOR — iterasi atas slice/array
    const angka = [_]u32{10, 20, 30, 40, 50};
    for (angka, 0..) |nilai, idx| {
        try stdout.print("[{d}]={d} ", .{idx, nilai});
    }
    try stdout.print("\n", .{});

    // SWITCH — harus exhaustive (semua kasus harus ditangani)
    const kode: u8 = 2;
    const pesan = switch (kode) {
        0 => "sukses",
        1 => "peringatan",
        2 => "error",
        3...10 => "error serius",  // range
        else => "tidak dikenal",
    };
    try stdout.print("Kode {d}: {s}\n", .{kode, pesan});

    // LABELED BLOCKS — powerful untuk early return dari blok
    const hasil = blk: {
        const a: u32 = 10;
        const b: u32 = 20;
        if (a > b) break :blk a;
        break :blk b;
    };
    try stdout.print("Maksimum: {d}\n", .{hasil});
}
```

## Part 4 : Struct - Tipe Data Kustom

```zig
const std = @import("std");

// Struct di Zig adalah value type (disalin, bukan direferensikan)
const Point = struct {
    x: f64,
    y: f64,

    // Method — 'self' bisa berupa nilai atau pointer
    pub fn distanceTo(self: Point, other: Point) f64 {
        const dx = self.x - other.x;
        const dy = self.y - other.y;
        return std.math.sqrt(dx * dx + dy * dy);
    }

    // Method yang memodifikasi — self harus *Point
    pub fn scale(self: *Point, factor: f64) void {
        self.x *= factor;
        self.y *= factor;
    }

    // 'init' adalah konvensi Zig (bukan constructor otomatis)
    pub fn init(x: f64, y: f64) Point {
        return .{ .x = x, .y = y };
    }
};

// Struct dengan Allocator — pola untuk heap-allocated struct
const DynamicBuffer = struct {
    data: []u8,
    allocator: std.mem.Allocator,

    // Selalu butuh Allocator untuk init
    pub fn init(allocator: std.mem.Allocator, size: usize) !DynamicBuffer {
        const data = try allocator.alloc(u8, size);
        return .{
            .data = data,
            .allocator = allocator,
        };
    }

    // Selalu ada deinit untuk membebaskan memory
    pub fn deinit(self: DynamicBuffer) void {
        self.allocator.free(self.data);
    }

    pub fn write(self: *DynamicBuffer, offset: usize, byte: u8) void {
        self.data[offset] = byte;
    }
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Struct initialization dengan named fields
    var p1 = Point.init(0, 0);
    var p2 = Point{ .x = 3.0, .y = 4.0 };

    try stdout.print("Jarak: {d:.2}\n", .{p1.distanceTo(p2)});

    p1.scale(2.0);
    try stdout.print("P1 setelah scale: ({d:.1}, {d:.1})\n", .{p1.x, p1.y});

    // DynamicBuffer — heap allocated
    var buf = try DynamicBuffer.init(allocator, 256);
    defer buf.deinit(); // DIJAMIN bebas

    buf.write(0, 'Z');
    buf.write(1, 'i');
    buf.write(2, 'g');
    try stdout.print("Buffer[0..3]: {s}\n", .{buf.data[0..3]});

    _ = p2;
}
```

## Part 5 : Error Handling - Proye Nyata

```zig
const std = @import("std");

// Definisikan error domain aplikasi kita
const ConfigError = error{
    FileNotFound,
    InvalidSyntax,
    MissingRequiredKey,
    ValueOutOfRange,
};

// Struct konfigurasi
const Config = struct {
    port: u16,
    max_connections: u32,
    debug_mode: bool,

    // Default config
    pub fn default() Config {
        return .{
            .port = 8080,
            .max_connections = 100,
            .debug_mode = false,
        };
    }

    // Parse dari string sederhana (format: "key=value\n")
    pub fn parseFromMemory(
        data: []const u8,
        allocator: std.mem.Allocator,
    ) !Config {
        _ = allocator; // tidak dipakai di contoh ini
        var config = Config.default();

        var lines = std.mem.splitScalar(u8, data, '\n');
        while (lines.next()) |line| {
            if (line.len == 0) continue;

            const sep = std.mem.indexOf(u8, line, '=') orelse {
                return ConfigError.InvalidSyntax;
            };

            const key = std.mem.trim(u8, line[0..sep], " \t");
            const val = std.mem.trim(u8, line[sep+1..], " \t\r");

            if (std.mem.eql(u8, key, "port")) {
                config.port = std.fmt.parseInt(u16, val, 10)
                    catch return ConfigError.ValueOutOfRange;
            } else if (std.mem.eql(u8, key, "max_connections")) {
                config.max_connections = std.fmt.parseInt(u32, val, 10)
                    catch return ConfigError.ValueOutOfRange;
            } else if (std.mem.eql(u8, key, "debug_mode")) {
                config.debug_mode = std.mem.eql(u8, val, "true");
            }
        }

        return config;
    }
};

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const config_data =
        \\port = 9090
        \\max_connections = 500
        \\debug_mode = true
    ;

    // Pola: gunakan catch untuk handle error dengan graceful
    const config = Config.parseFromMemory(config_data, allocator) catch |err| {
        try stdout.print("Gagal parse config: {}\n", .{err});
        try stdout.print("Menggunakan default config\n", .{});
        Config.default()
    };

    try stdout.print("Config dimuat:\n", .{});
    try stdout.print("  Port: {d}\n", .{config.port});
    try stdout.print("  Max Koneksi: {d}\n", .{config.max_connections});
    try stdout.print("  Debug: {}\n", .{config.debug_mode});
}
```

## Part 6 : Comptime - Generics Stack

```zig
const std = @import("std");

// Generic Stack menggunakan comptime
// 'comptime T: type' membuat ini bekerja untuk SEMUA tipe
fn Stack(comptime T: type) type {
    // Fungsi comptime mengembalikan TIPE — ini idiom Zig untuk generics
    return struct {
        const Self = @This();

        items: []T,
        len: usize,
        allocator: std.mem.Allocator,

        pub fn init(allocator: std.mem.Allocator, capacity: usize) !Self {
            const items = try allocator.alloc(T, capacity);
            return .{
                .items = items,
                .len = 0,
                .allocator = allocator,
            };
        }

        pub fn deinit(self: Self) void {
            self.allocator.free(self.items);
        }

        pub fn push(self: *Self, item: T) !void {
            if (self.len >= self.items.len) {
                return error.StackOverflow;
            }
            self.items[self.len] = item;
            self.len += 1;
        }

        pub fn pop(self: *Self) ?T {
            if (self.len == 0) return null;
            self.len -= 1;
            return self.items[self.len];
        }

        pub fn peek(self: Self) ?T {
            if (self.len == 0) return null;
            return self.items[self.len - 1];
        }

        pub fn isEmpty(self: Self) bool {
            return self.len == 0;
        }
    };
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Stack(u32) — stack of integers
    var int_stack = try Stack(u32).init(allocator, 10);
    defer int_stack.deinit();

    try int_stack.push(10);
    try int_stack.push(20);
    try int_stack.push(30);

    while (int_stack.pop()) |val| {
        try stdout.print("Popped: {d}\n", .{val});
    }

    // Stack([]const u8) — stack of strings (SAMA kode, tipe berbeda)
    var str_stack = try Stack([]const u8).init(allocator, 5);
    defer str_stack.deinit();

    try str_stack.push("pertama");
    try str_stack.push("kedua");
    try str_stack.push("ketiga");

    if (str_stack.peek()) |top| {
        try stdout.print("Puncak stack: {s}\n", .{top});
    }
}
```

---

<div align="center">

    @[Gh0sT4n](https://github.com/gh0st4n) - [T4n OS](https://t4n-labs.github.io/t4n-os) - [Zig 0.16.0](https://ziglang.org/documentation/0.16.0)

    [<- Previously](./01-MateriTeori.md) | [Next ->](./03-VisualisasiMemori.md)

</div>