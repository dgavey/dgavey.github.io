#!/bin/bash

# Create the output directory if it doesn't exist
mkdir -p ./assets/images/shows/thumb

# Process each image in the source directory
find ./assets/images/shows -maxdepth 1 -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif -o -iname \*.webp \) | while read img; do
    # Get the filename without the path
    filename=$(basename "$img")
    
    # Check if thumbnail already exists
    if [ ! -f "./assets/images/shows/thumb/$filename" ]; then
        echo "Processing: $filename"
        
        # Convert and resize the image while maintaining aspect ratio
        magick "$img" -resize "225x225>" "./assets/images/shows/thumb/$filename"
    else
        echo "Skipping: $filename (thumbnail already exists)"
    fi
done

echo "Processing complete!"