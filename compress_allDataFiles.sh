#!/bin/bash

# Compress DataSet folders
for folder in {NDJSON_FILES,ZED_FILES}; do
    if [ ! -d "DataSet/$folder" ]; then
        echo "-- ERROR: 'DataSet/$folder' NOT EXIST. EXITING..."
    else
        tar -czf "DataSet/${folder}.tar.gz" -C "DataSet" "$folder"
        rm -r "DataSet/$folder"
        echo "- FOLDER: 'DataSet/$folder' DONE"
    fi
done
echo "--- COMPRESSED: 'DataSet'"

#Compress Querying
for base_directory in {JSON,ZED}/Querying; do
    for person_dir in "$base_directory"/{brandon,peter,ruiping,siya}; do
        if [ -d "$person_dir" ]; then
            tar -czf "$person_dir/query_results.tar.gz" -C "$person_dir" query_results
            rm -r "$person_dir/query_results"
            echo "- FILE: '$person_dir/query_results' DONE"
        else
            echo "-- ERROR: '$person_dir' NOT EXIST"
        fi
    done
    echo "-- FOLDER: '$base_directory' DONE"
done
echo "--- COMPRESSED: 'Querying'"
