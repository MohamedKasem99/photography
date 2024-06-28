#!/bin/bash

# Directory paths
FULLS_DIR="./images/fulls"
THUMBS_DIR="./images/thumbs"

# Create thumbnails directory if it doesn't exist
mkdir -p "$THUMBS_DIR"

# Loop through all image files in the fulls directory
for img in "$FULLS_DIR"/*.{jpg,jpeg,png,gif}; do
    if [[ -f "$img" ]]; then
        # Get the filename without the directory
        filename=$(basename "$img")
        # Resize the image to 50% of its original size and save it to the thumbs directory
        convert "$img" -resize 50% "$THUMBS_DIR/$filename"
        echo "Resized $img and saved to $THUMBS_DIR/$filename"
    fi
done
