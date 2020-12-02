const std = @import("std");
var alloc = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = &alloc.allocator;

pub fn print(comptime fmt: []const u8, args: anytype) void {
    std.debug.print(fmt++"\n", args);
}

pub fn split(in: []const u8, delim: []const u8) ![][]const u8 {
    const list = &std.ArrayList([]const u8).init(gpa);
    const iter = &std.mem.split(in, delim);
    while (iter.next()) |str| {
        try list.append(str);
    }
    return list.items;
}

pub fn trim_prefix(in: []const u8, prefix: []const u8) []const u8 {
    if (std.mem.startsWith(u8, in, prefix)) {
        return in[prefix.len..];
    }
    return in;
}

pub fn trim_suffix(comptime T: type, in: []const T, suffix: []const T) []const T {
    if (std.mem.endsWith(T, in, suffix)) {
        return in[0..in.len-suffix.len];
    }
    return in;
}
