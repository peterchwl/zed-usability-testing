#!/bin/bash

# Compress DataSet
#folder_to_compress="DataSet"
#zip_file_name="DataSetzipped.zip"
#cd "$(dirname "$folder_to_compress")"
#zip -r "$zip_file_name" "$(basename "$folder_to_compress")"
#echo "Compression complete: $zip_file_name"
tar -czvf DataSet.tar.gz DataSet
echo "Compression complete: DataSet"

#Compress JSON Querying
# folder_to_compress="JSON/Querying"
# zip_file_name="JSON-Querying.zip"
# cd "$(dirname "$folder_to_compress")"
# zip -r "$zip_file_name" "$(basename "$folder_to_compress")"
# echo "Compression complete: $zip_file_name"
cd JSON
tar -czvf JSON-Querying.tar.gz Querying
echo "Compression complete: JSON/Querying"


#Compress Zed Querying
# folder_to_compress="../Zed"
# zip_file_name="Zed.zip"
# cd "$(dirname "$folder_to_compress")"
# zip -r "$zip_file_name" "$(basename "$folder_to_compress")"
# echo "Compression complete: $zip_file_name"
cd ../
tar -czvf Zed.tar.gz Zed
echo "Compression complete: Zed"

#get out of Zed querying and remove all the files that have been zipped
rm -r DataSet
rm -r Zed
rm -r JSON/Querying


