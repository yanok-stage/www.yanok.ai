#!/bin/bash

# Function to convert a single file
convert_to_webp() {
  local file="$1"
  local output="${file%.png}.webp"
  
  cwebp "$file" -o "$output" && echo "Converted $file to $output"
}

export -f convert_to_webp

# Find all PNG files and convert them to WEBP in parallel using GNU Parallel
find . -name "*.png" | parallel convert_to_webp {}

