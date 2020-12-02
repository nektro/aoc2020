const std = @import("std");
const Allocator = std.mem.Allocator;
const assert = std.debug.assert;
const print = std.debug.print;
const util = @import("./util.zig");

pub fn main() !void {
    util.print("part 1: {} correct passwords", .{try part1()});
    util.print("part 2: {} correct passwords", .{try part2()});
}

fn part1() !u32 {
    var input = std.mem.split(@embedFile("./../input/day02.txt"), "\n");
    var count: u32 = 0;
    while (input.next()) |line| {
        var items = std.mem.split(line, " ");
        const policy = try util.split(items.next().?, "-");
        const letter = util.trim_suffix(u8, items.next().?, ":")[0];
        const passwd = items.next().?;

        const lower_bound = try std.fmt.parseInt(u32, policy[0], 10);
        const upper_bound = try std.fmt.parseInt(u32, policy[1], 10);

        var i: u32 = 0;
        for (passwd) |c| {
            if (c == letter) {
                i += 1;
            }
        }
        if (i >= lower_bound and i <= upper_bound) {
            count += 1;
        }
    }
    return count;
}

fn part2() !u32 {
    var input = std.mem.split(@embedFile("./../input/day02.txt"), "\n");
    var count: u32 = 0;
    while (input.next()) |line| {
        var items = std.mem.split(line, " ");
        const policy = try util.split(items.next().?, "-");
        const letter = util.trim_suffix(u8, items.next().?, ":")[0];
        const passwd = items.next().?;

        const lower_bound = try std.fmt.parseInt(u32, policy[0], 10);
        const upper_bound = try std.fmt.parseInt(u32, policy[1], 10);

        const a = passwd[lower_bound-1] == letter;
        const b = passwd[upper_bound-1] == letter;
        if (a != b) {
            count += 1;
        }
    }
    return count;
}
