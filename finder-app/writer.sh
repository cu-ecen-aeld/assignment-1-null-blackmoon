#!/bin/bash


if [ $# -eq 0 ]
then
    echo "insufficient number of arguments"
    exit 1
elif [[ $# -eq 1 ]]
then
    echo "not enough arguments"
elif [[ $# -eq 2 ]]
then
    echo "Writing to file $1"
    echo "Contents are \"$2\" "
    writefile="$1" #put the commands in quotes to ensure that the program resolves the command line argument as a string
    writestr="$2"

    if [ -z "$writefile" ] #make sure there is a single space padding in the brackets or the code will mistake it for some other input
    then
        echo "file not specified"
        exit 1
    fi

    if [ -z "$writestr" ]
    then
        echo "string not specified"
        exit 1
    fi

    # Create the file and write the content
    echo "$writestr" > "$writefile"

    # Check if the file was created successfully
    if [ $? -ne 0 ]; then
      echo "Error: Failed to create the file."
      exit 1
    fi

fi

# Exit with success
exit 0
