#!/bin/bash

# Loop through the folders
for folder in {NDJSON_FILES,ZED_FILES}; do
    if [ ! -f "DataSet/${folder}.tar.gz" ]; then
        echo "-- ERROR: 'DataSet/${folder}.tar.gz' NOT EXIST. EXITING..."
    else
        tar -xzf "DataSet/${folder}.tar.gz" -C "DataSet"
        rm "DataSet/${folder}.tar.gz"
        echo "- FOLDER: 'DataSet/$folder' DONE"
    fi
done
echo "--- UNCOMPRESSED: 'DataSet'"

# Loop through the specified subdirectories
for base_directory in {JSON,ZED}/Querying; do
    for person_dir in "$base_directory"/{brandon,peter,ruiping,siya}; do
        if [ -d "$person_dir" ]; then
            tar -xzf "$person_dir/query_results.tar.gz" -C "$person_dir"
            rm "$person_dir/query_results.tar.gz"
            echo "- FILE: '$person_dir/query_results.tar.gz' DONE"
        else
            echo "-- ERROR: '$person_dir' NOT EXIST"
        fi
    done
    echo "-- FOLDER: '$base_directory' DONE"
done
echo "--- UNCOMPRESSED: 'Querying'"