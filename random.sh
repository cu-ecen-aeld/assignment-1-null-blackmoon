#!/bin/bash

# Function to recursively iterate through files in a directory
traverse_directory() {
    local directory=$1

    # Loop through all files and directories in the given directory
    for item in "$directory"/*
    do
        if [ -f $item ]; then
            echo "Found file: $item"
            # Perform operations on the file here
        elif [ -d $item ]; then
            echo "Entering directory: $item"
            # Recursively call the function for subdirectories
            traverse_directory "$item"
        fi
    done
}

# Specify the directory to start the traversal


# Call the function with the starting directory
traverse_directory $1
