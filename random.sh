#!/bin/bash

# # Function to recursively iterate through files in a directory
# traverse_directory() {
#     local directory=$1
#
#     # Loop through all files and directories in the given directory
#     for item in "$directory"/*
#     do
#         if [ -f $item ]; then
#             echo "Found file: $item"
#             # Perform operations on the file here
#         elif [ -d $item ]; then
#             echo "Entering directory: $item"
#             # Recursively call the function for subdirectories
#             traverse_directory "$item"
#         fi
#     done
# }
#
# # Specify the directory to start the traversal
#
#
# # Call the function with the starting directory
# traverse_directory $1




count_matching_lines() {
    local file="$1"
    local count=0
    while IFS= read -r line; do
        if [[ $line == *"copy"* ]]; then
            ((count++))
            echo "found"
        fi
    done < "$file" #We assume that feeding a file into the read input causes the file contents to be fed into the file. Using the cat utility might also perform the same function, however, expect disparities if there is binary data in the filesyste.
    echo "$count"
}

count_matching_lines $1
