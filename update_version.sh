#!/bin/bash

# Read the version from the file
version=$(cat version.txt)

# Split the version into parts, add 1 to the last part, and join it back
parts=(${version//./ })
last=${parts[${#parts[@]}-1]}
((last++))
parts[${#parts[@]}-1]=$last
new_version=$(IFS=.; echo "${parts[*]}")

# Save the new version back to the file
echo "$new_version" > version.txt

echo "Updated version: $new_version"
