#!/bin/fish

set SRC_DIR (realpath (status dirname))
set SRC_FILES (ls $SRC_DIR/*.jsonnet)
set OUTPUT_DIR "/mnt/c/Users/jeppe/AppData/Roaming/espanso/user/"
# set OUTPUT_DIR "/home/jeppe/Temp/"

echo "Putting files in output directory $OUTPUT_DIR"

for f in $SRC_FILES
    set fn_jsonnet (string split -r -m1 / $f)[2]
    set fn (string split -r -m1 . $fn_jsonnet)[1]
    set fn_yml "$fn.yml"
    set f_out "$OUTPUT_DIR""$fn_yml"

    # Copy to output dir
    # jsonnet -S $f -o "$fn.yml"
    echo -e "# Generated from jsonnet. Do not edit!\n" > $f_out
    jsonnet -S $f >> $f_out

    echo "Generated $f_out"
end

echo "Processed all files."
