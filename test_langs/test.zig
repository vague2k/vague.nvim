const std = @import("std");

pub fn main() !void {
    var listener = try std.net.tcpListen(.{
        .address = std.net.Address.parseIp4("0.0.0.0") catch |err| {
            std.debug.print("Error parsing IP: {}\n", .{err});
            return;
        },
        .port = 8080,
    });

    defer listener.close();
    std.debug.print("TCP server listening on port 8080\n", .{});

    while (true) {
        const conn = try listener.accept();
        _ = std.Thread.spawn(.{}, handleConnection, conn) catch |err| {
            std.debug.print("Failed to spawn thread: {}\n", .{err});
            conn.close();
        };
    }
}

fn handleConnection(conn: std.net.Stream) !void {
    defer conn.close();
    const allocator = std.heap.page_allocator;

    std.debug.print("Client connected: {}\n", .{conn.peerAddress()});

    var buf = try allocator.alloc(u8, 1024);
    defer allocator.free(buf);

    while (true) {
        const bytes_read = try conn.read(&buf);
        if (bytes_read == 0) break; // Client disconnected
        const message = buf[0..bytes_read];
        std.debug.print("Received: {}\n", .{message});
        if (std.mem.indexOf(u8, message, "exit") != null) {
            std.debug.print("Client disconnected\n", .{});
            break;
        }
        try conn.writeAll(message);
    }
}
