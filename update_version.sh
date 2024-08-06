#!/bin/bash

# File containing the version history
VERSION_FILE="version.txt"

# Ensure the file exists and is not empty, initialize with 1.0.0 if not
if [ ! -f "$VERSION_FILE" ] || [ ! -s "$VERSION_FILE" ]; then
  echo "1.0.0" > "$VERSION_FILE"
fi

# Read the last line from the file
version=$(tail -n 1 "$VERSION_FILE")
echo "Current version from file: $version"

# Split the version into parts, add 1 to the last part, and join it back
IFS='.' read -r -a parts <<< "$version"
last=${parts[${#parts[@]}-1]}
((last++))
parts[${#parts[@]}-1]=$last
new_version=$(IFS=.; echo "${parts[*]}")
echo "New version to append: $new_version"

# Append the new version to the file
echo "$new_version" >> "$VERSION_FILE"

# Output the new version
echo "Updated version: $new_version"
