#!/bin/bash

while true; do
  read -p "Enter the file type: homogeneous/heterogeneous " input
  echo "You chose to open $input.ndjson file"

  if [ "$input" == "homogeneous" ]; then
    FILE_PATH="/Users/iris-fang/Documents/code/zed-usability-testing/JSON/Ingesting/ruiping/homogeneous.ndjson"
    break
  elif [ "$input" == "heterogeneous" ]; then
    FILE_PATH="/Users/iris-fang/Documents/GitHub/zed-usability-testing/JSON/Querying/ruiping/heterogeneous.ndjson"
    break
  else
    echo "Invalid input, please enter 'homogeneous' or 'heterogeneous'"
  fi
done

FILE_OUTPUT="/Users/iris-fang/Documents/GitHub/zed-usability-testing/JSON/Querying/ruiping"

echo "Search Query 1 Done"
jq 'select(.ts=="2018-03-24T17:15:21.196410Z")' "$FILE_PATH" > $FILE_OUTPUT"/${input}_results/search_query1.txt"

echo "Search Query 2 Done"
jq 'select(._path == "http")' "$FILE_PATH" > "$FILE_OUTPUT/${input}_results/search_query2.txt"

echo "Search Query 3 Done"
jq 'select(.status_code == 404)' "$FILE_PATH" > "$FILE_OUTPUT/${input}_results/search_query3.txt"

echo "Analytical Query 1 Done"
jq -s 'map(._path) | unique' "$FILE_PATH" > "$FILE_OUTPUT/${input}_results/analytical_query1.txt"

echo "Analytical Query 2 Done"
jq -r 'select(.["_path"] != null) | .["_path"]' $FILE_PATH | sort | uniq -c | sort -k2,2 | awk '{print $2, $1}' > "$FILE_OUTPUT/${input}_results/analytical_query2.txt"

echo "Analytical Query 3 Done"
jq -s 'map(.response_body_len) | add / length' "$FILE_PATH" > "$FILE_OUTPUT/${input}_results/analytical_query3.txt"
