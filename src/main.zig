// ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
// ┃                     DDComments v0.5.0                         ┃
// ┃                                                               ┃
// ┃            Remove comments from source code files             ┃
// ┃          Written in Zig for optimal performance and           ┃
// ┃               multi-platform compatibility                    ┃
// ┃                                                               ┃
// ┃                  Created by: aliel0malki                      ┃
// ┃                Last Updated: 2024-11-4                        ┃
// ┃                      License: MIT                             ┃
// ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

const std = @import("std");
pub fn main() !void {
    const args = try std.process.argsAlloc(std.heap.page_allocator);
    if (args.len != 3) {
        std.debug.print("Usage: ddcomments <directory> <output directory>\n", .{});
        return;
    }
    const directory = args[1];
    const outputDirectory = args[2];

    std.fs.cwd().makeDir(outputDirectory) catch |err| switch (err) {
        error.PathAlreadyExists => {
            std.fs.cwd().deleteTree(outputDirectory) catch |e| {
                std.debug.print("Error deleting existing output directory {s}: {s}\n", .{ outputDirectory, @errorName(e) });
                return;
            };
            std.fs.cwd().makeDir(outputDirectory) catch |e| {
                std.debug.print("Error creating output directory {s}: {s}\n", .{ outputDirectory, @errorName(e) });
                return;
            };
        },
        else => |e| return e,
    };

    var dir = try std.fs.cwd().openDir(directory, .{ .iterate = true });
    defer dir.close();
    var iterator = dir.iterate();
    while (try iterator.next()) |entry| {
        if (entry.kind == .file) {
            const fullPath = try std.fs.path.join(std.heap.page_allocator, &.{ directory, entry.name });
            std.debug.print("Processing file: {s}\n", .{fullPath});
            processFile(outputDirectory, fullPath) catch |err| {
                std.debug.print("Error processing file {s}: {s}\n", .{ entry.name, @errorName(err) });
            };
        }
    }
}
fn processFile(outputDirectory: []const u8, filePath: []const u8) !void {
    const file = try std.fs.cwd().openFile(filePath, .{ .mode = std.fs.File.OpenMode.read_only });
    defer file.close();

    const outputFileName = std.fs.path.basename(filePath);
    const outputFilePath = try std.fs.path.join(std.heap.page_allocator, &.{ outputDirectory, outputFileName });
    const output = try std.fs.cwd().createFile(outputFilePath, .{ .mode = 0o644 });
    defer output.close();
    var reader = file.reader();
    var writer = output.writer();
    var buffer: [1024]u8 = undefined;
    var insideBlockComment = false;
    var insideString = false;
    while (try reader.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        var processedLine = line;
        const len = line.len;
        for (0..len) |i| {
            const currentChar = line[i];

            if (currentChar == '"' or currentChar == '\'') {
                insideString = !insideString;
            }

            if (insideString) continue;

            if (i + 1 < len and currentChar == '/' and line[i + 1] == '/') {
                processedLine = processedLine[0..i];
                break;
            }

            if (currentChar == '/' and i + 1 < len and line[i + 1] == '*') {
                insideBlockComment = true;
                processedLine = processedLine[0..i];
                break;
            }
            if (currentChar == '*' and i + 1 < len and line[i + 1] == '/') {
                insideBlockComment = false;

                processedLine = processedLine[0..i];
                break;
            }
        }

        if (insideBlockComment) {
            continue;
        }

        if (processedLine.len > 0) {
            try writer.writeAll(try std.mem.concat(std.heap.page_allocator, u8, &.{ processedLine, "\n" }));
        }
    }
    std.debug.print("{s}: COMPLETED\n", .{filePath});
}
