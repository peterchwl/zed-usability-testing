#!/bin/bash

# Set the zip file path and extraction folder
#zip_file="DataSetzipped.zip"
#extracted_folder="DataSet"
# Create the extraction folder if it doesn't exist
#mkdir -p "$extracted_folder"
# Unzip the files
#unzip "$zip_file" -d "$extracted_folder"


#unzip "$zip_file"
tar -xzvf DataSet.tar.gz
echo "Extraction complete for DataSet"
rm -f DataSet.tar.gz

cd JSON
#zip_file="JSON-Querying.zip"
#unzip "$zip_file"
tar -xzvf JSON-Querying.tar.gz
echo "Extraction complete for JSON/Querying"
#rm "$zip_file"
rm -f JSON-Querying.tar.gz

cd ../
#zip_file="Zed.zip"
#unzip "$zip_file"
tar -xzvf Zed.tar.gz
echo "Extraction complete for Zed"
#rm "$zip_file"
rm -f Zed.tar.gz