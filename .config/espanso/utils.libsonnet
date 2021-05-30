{
    processFilename(filename):
        local split = std.split(filename, "/");
        local fullName = split[std.length(split) - 1];

        std.split(fullName, ".")[0]
    ,

    generateUnicodeArray(startChar, num): [
        std.char(std.codepoint(startChar) + i)
        for i in std.range(0, num - 1)
    ],
}