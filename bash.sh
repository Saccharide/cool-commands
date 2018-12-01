#!/bin/sh

# find all mp3 files in current directory and create a playlist of it
find . -name "*.mp3" -exec echo "play" {} \; > playlist

# Shuffles the lines of a file -R = random
sort -R playlist -o playlist

# Convert Chinese unreadable filename to correct filename (AWESOME)
7z x -scs903 ZIPFILE.zip

# Find a string in current directory (-w stand for whole word, -r recursive)
grep -rnw . -e "STRING"

# Insert a newline at a specific line with sed -i [--in-place]
sed -i '/SOME_LINE/i \n' foo.txt 

# Read all files in a directory line by line
ls | while read f; do while read -r line; do echo $line; done < $f ; done

# Copy an entire directory to another dicretory
cp -R source dest

# Get the size of a directory with du -s (summary) -h human readable
du -h --max-depth=1 path | sort -hr

# Find all file with certain extension
find `pwd` -type f -name "*.txt"

# Save the output of a command to a variable
cwd=$(pwd)
