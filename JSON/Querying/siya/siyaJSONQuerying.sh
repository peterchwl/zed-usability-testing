#!/bin/bash


while true; do
  echo -n "Enter your type of file (homo/hetero): "
  read typeoffile

  if [ "$typeoffile" == "homo" ]; then
    FILE="../../../JSON/Ingesting/siya/siya_homo_data.ndjson"
    echo "You chose homogeneous."
    break
  elif [ "$typeoffile" == "hetero" ]; then
    FILE="../../../JSON/Ingesting/siya/siya_hetero_data.ndjson"
    echo "You chose heterogeneous."
    break
  else
    echo "Invalid input. Please enter 'homo' or 'hetero'."
  fi
done

echo "Search query 1"
jq -c 'select(.ts=="2018-03-24T17:15:21.196410Z")' $FILE > "query_results/"$typeoffile"geneous_results/search1.ndjson"

echo "Search query 2"
jq -c 'select(._path=="http")' $FILE > "query_results/"$typeoffile"geneous_results/search2.ndjson"

echo "Search query 3"
#jq 'select(."id.orig_h"=="10.47.5.155")' $FILE > $typeoffile"geneous_results/search3.txt"
jq -c 'select(.[]| tostring | contains("10.47.5.155"))' $FILE > "query_results/"$typeoffile"geneous_results/search3.ndjson"

echo "Analytical query 1"
jq -c '._path' $FILE | sort -u > "query_results/"$typeoffile"geneous_results/analytical1.txt"

echo "Analytical query 2" 
jq -c 'select(.["_path"] != null) | .["_path"]' $FILE | sort | uniq -c  > "query_results/"$typeoffile"geneous_results/analytical2.txt"

echo "Analytical query 3"
jq -c -s 'map(select(.response_body_len != null).response_body_len) | add/length' $FILE > "query_results/"$typeoffile"geneous_results/analytical3.txt"



