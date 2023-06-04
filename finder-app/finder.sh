#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Please provide the directory path and the search string."
    exit 1
fi

# Get the directory path and search string
filesdir="$1"
searchstr="$2"

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory."
    exit 1
fi

# Function to count the number of matching lines in a file
count_matching_lines() {
    local file="$1"
    local count=0
    while IFS= read -r line; do
        if [[ $line == *"$searchstr"* ]]; then #searches the files for the searchstr variable. This is case sensitive, and this can be substituted for a regex expression if necessary as regex is generally more powerful and has lookahead and look backwards capabilities that can increase performance
            ((count++))
        fi
    done < "$file" #We assume that feeding a file into the read input causes the file contents to be fed into the file. Using the cat utility might also perform the same function, however, expect disparities if there is binary data in the filesyste.
    echo "$count"
}

# Function to recursively count files and matching lines
count_files_and_lines() {
    local dir="$1"
    local file_count=0
    local line_count=0

    # Loop through all files and directories
    while IFS= read -r -d '' entry; do #The -d flag delimits on null characters found in the find output. The -r flag ensures that backslashes are not interpreted as escape characters, as the find output pushes relative pathnames to the current working directory, and there are bound to be slashes in the feed.
        if [ -f "$entry" ]; then
            ((file_count++))
            lines=$(count_matching_lines "$entry")
            ((line_count += lines))
        fi
    done < <(find "$dir" -type f -print0) #The find process is what feeds the IFS/read loop in the preceding block.

    echo "The number of files are $file_count and the number of matching lines are $line_count"
}

# Invoke the main function
count_files_and_lines "$filesdir"
