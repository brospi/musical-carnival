#!/bin/bash

# Create folders data_00 to data_99
for i in {0..99}; do
  folder=$(printf "data_%02d" "$i")
  mkdir -p "$folder"
done
mkdir -p "data_2A"
mkdir -p "data_2B"

# Move each .csv.gz file to the corresponding folder
for file in *.csv.gz; do
  # Extract the first two digits of the filename
  prefix=$(basename "$file" | cut -c1-2)
  folder="data_$prefix"
  if [[ -d "$folder" ]]; then
    mv "$file" "$folder/"
  else
    echo "Skipping $file: Folder $folder does not exist"
  fi
done
