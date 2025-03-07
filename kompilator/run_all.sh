#!/bin/bash

if [ ! -d "sample_files" ]; then
    echo "Error: sample_files directory not found!"
    exit 1
fi


for FILE in sample_files/*; do
    #echo "Running make exec FILE=$FILE..."
    
    OUTPUT=$(make exec FILE="$FILE" 2>&1)

    if echo "$OUTPUT" | grep -q "Syntax analysis successful! ✅"; then
        echo "$FILE : SUCCESS ✅"
    else
        echo "$FILE : ERROR ❌"
        #echo "----- OUTPUT -----"
        #echo "$OUTPUT"
        #echo "------------------"
    fi
done

