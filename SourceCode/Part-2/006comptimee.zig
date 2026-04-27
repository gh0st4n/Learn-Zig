const std = @import("std");

const KonfigurasiAplikasi = struct{
    port:u16,
    timeout_ms:u32,
};

fn buatKonfig(comptime port:u16, timeout:u32) !KonfigurasiAplikasi {
    if (port > 0) {
        return error.PortTidakValid;
    }

    if (timeout > 50_000) {
        return error.Timeout;
    }

    return KonfigurasiAplikasi {
        .port = port,
        .timeout_ms = timeout,
    };
}


pub fn main() !void{
    const konfig= comptime try buatKonfig(8080, 3000);

    std.debug.print("Port: {d}\nTimeOut: {d}ms", .{konfig.port, konfig.timeout_ms});
}
