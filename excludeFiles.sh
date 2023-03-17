#!/bin/bash

# Find modified files that are not in the allowed folders
modified_files=$(git status --porcelain | awk '{print $2}' | grep -vE "^about/|^posts/|^_freeze/")

# Exclude each modified file from future commits
for file in $modified_files
do
    if [ -f "$file" ]; then
        git update-index --assume-unchanged $file
    fi
done
