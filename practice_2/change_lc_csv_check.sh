#!/bin/bash

# Input folder containing .lc files
tess_file="/Users/anapereira/Documents/tess_practice/tess_csv_lc"

# Folder where the .lc files are stored
tess_file_modified="$tess_file/practice_2"

# Output folder for the renamed .csv files
csv_output="$tess_file/csv_from_lc"

# Create output folder if it doesn't exist
mkdir -p "$csv_output"

# Loop over .lc files and copy them to the new folder as .csv
for tess_lc in "$tess_file_modified"/*.lc; do
    base_name=$(basename "$tess_lc" .lc)
    cp "$tess_lc" "$csv_output/${base_name}.csv"
done

