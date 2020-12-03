const std = @import("std");
const Allocator = std.mem.Allocator;
const assert = std.debug.assert;
const print = std.debug.print;
const util = @import("./util.zig");

pub fn main() !void {

    var input = try util.split(@embedFile("./../input/day03.txt"), "\n");
    const w = input[0].len;
    const h = input.len;

    print("part 1:\n", .{});
    print("\t{} trees hit\n", .{treesHit(input, w, h, 3, 1)});

    print("part 2:\n", .{});
    const a1 = treesHit(input, w, h, 1, 1);
    print("\t{} trees hit\n", .{a1});
    const a2 = treesHit(input, w, h, 3, 1);
    print("\t{} trees hit\n", .{a2});
    const a3 = treesHit(input, w, h, 5, 1);
    print("\t{} trees hit\n", .{a3});
    const a4 = treesHit(input, w, h, 7, 1);
    print("\t{} trees hit\n", .{a4});
    const a5 = treesHit(input, w, h, 1, 2);
    print("\t{} trees hit\n", .{a5});
    print("\t{} <- answer\n", .{a1*a2*a3*a4*a5});
}

fn treesHit(input: [][]const u8, w: u64, h: u64, dx: u64, dy: u64) u64 {
    var x: u64 = 0;
    var y: u64 = 0;
    var trees_hit: u64 = 0;

    while (true) {
        if (input[y][x] == '#') {
            trees_hit += 1;
        }
        if (y == h-1) {
            break;
        }

        x += dx;
        x %= w;

        y += dy;
        y %= h;
    }
    return trees_hit;
}
