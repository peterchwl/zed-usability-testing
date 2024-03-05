#!/bin/bash

# Set the zip file path and extraction folder
zip_file="DataSetzipped.zip"
#extracted_folder="DataSet"
# Create the extraction folder if it doesn't exist
#mkdir -p "$extracted_folder"
# Unzip the files
#unzip "$zip_file" -d "$extracted_folder"
unzip "$zip_file"
echo "Extraction complete for DataSet"
rm "$zip_file"

cd JSON
zip_file="JSON-Querying.zip"
unzip "$zip_file"
echo "Extraction complete for JSON/Querying"
rm "$zip_file"

cd ../
zip_file="Zed.zip"
unzip "$zip_file"
echo "Extraction complete for Zed"
rm "$zip_file"


