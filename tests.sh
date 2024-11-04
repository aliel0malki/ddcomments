#!/bin/sh
TEST_DIR="__tests__"
OUTPUT_DIR="output"
mkdir -p "$OUTPUT_DIR"
ARCH=$(uname -m)
OS=$(uname)
EXE=""
case "$ARCH" in
    aarch64)
        if [ "$OS" = "Linux" ]; then
            EXE="zig-out/aarch64-linux/ddcomments"
        elif [ "$OS" = "Darwin" ]; then
            EXE="zig-out/aarch64-macos/ddcomments"
        fi
        ;;
    x86_64)
        if [ "$OS" = "Linux" ]; then
            EXE="zig-out/x86_64-linux-gnu/ddcomments"
        fi
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
		echo ""
        exit 1
        ;;
esac
if [ ! -f "$EXE" ]; then
    echo "Executable not found: $EXE"
	echo ""
    exit 1
fi
echo "Running $EXE with arguments: $TEST_DIR $OUTPUT_DIR..."
echo ""
if [ $? -eq 0 ]; then
    echo "Execution of $EXE completed successfully."
	echo ""
else
    echo "There was an error during execution of $EXE. Check log for details."
	echo ""
fi
rm -r "$OUTPUT_DIR"
