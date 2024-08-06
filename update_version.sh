#!/bin/bash

# File containing the version history
VERSION_FILE="version.txt"

# Ensure the file exists and is not empty
if [ ! -f "$VERSION_FILE" ] || [ ! -s "$VERSION_FILE" ]; then
  echo "1.0.0" > "$VERSION_FILE"
fi

# Read the last line from the file
version=$(tail -n 1 "$VERSION_FILE")

# Split the version into parts, add 1 to the last part, and join it back
parts=(${version//./ })
last=${parts[${#parts[@]}-1]}
((last++))
parts[${#parts[@]}-1]=$last
new_version=$(IFS=.; echo "${parts[*]}")

# Append the new version to the file
echo "$new_version" >> "$VERSION_FILE"

# Output the new version
echo "Updated version: $new_version"
