#!/bin/bash

# Check if the correct number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path_to_yml_file> <new_WG_HOST_value>"
    exit 1
fi

# Assign arguments to variables
YML_FILE=$1
NEW_WG_HOST_VALUE=$2

# Check if the file exists
if [ ! -f "$YML_FILE" ]; then
    echo "File not found: $YML_FILE"
    exit 1
fi

# Use sed to uncomment and update the WG_HOST value
sed -i.bak -E "s/#?([[:space:]]*-[[:space:]]*WG_HOST=).*/\1$NEW_WG_HOST_VALUE/" "$YML_FILE"

# Check if sed command was successful
if [ $? -eq 0 ]; then
    echo "Successfully updated WG_HOST value in $YML_FILE"
else
    echo "Failed to update WG_HOST value in $YML_FILE"
    exit 1
fi
