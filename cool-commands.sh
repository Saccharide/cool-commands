#!/bin/sh

# find all mp3 files in current directory and create a playlist of it
find . -name "*.mp3" -exec echo "play" {} \; > playlist

# Shuffles the playlist
sort -R playlist -o playlist

# Convert Chinese unreadable filename to correct filename (AWESOME)
7z x -scs903 ZIPFILE.zip
