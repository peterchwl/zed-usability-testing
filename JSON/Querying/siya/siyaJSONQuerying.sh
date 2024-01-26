#!/bin/bash


while true; do
  echo -n "Enter your type of file (homo/hetero): "
  read typeoffile

  if [ "$typeoffile" == "homo" ]; then
    FILE="../../../JSON/Ingesting/siya/siya_homo_data.ndjson"
    echo "You chose homo."
    break
  elif [ "$typeoffile" == "hetero" ]; then
    FILE="../../../JSON/Ingesting/siya/siya_hetero_data.ndjson"
    echo "You chose hetero."
    break
  else
    echo "Invalid input. Please enter 'homo' or 'hetero'."
  fi
done

echo "Search query 1"
jq -c 'select(.ts=="2018-03-24T17:15:21.196410Z")' $FILE > $typeoffile"geneous_results/search1.txt"

echo "Search query 2"
jq -c 'select(._path=="http")' $FILE > $typeoffile"geneous_results/search2.txt"

echo "Search query 3"
jq -c 'select(."id.orig_h"=="10.47.5.155")' $FILE > $typeoffile"geneous_results/search3.txt"

echo "Analytical query 1"
jq -r '._path' $FILE | sort -u > $typeoffile"geneous_results/analytical1.txt"

echo "Analytical query 2"
jq -c 'select(."id.resp_p"!=null) ' $FILE >  $typeoffile"geneous_results/analytical2.txt"

echo "Analytical query 3"
jq -c -s 'map(.response_body_len) | add/length' $FILE  > $typeoffile"geneous_results/analytical3.txt"



