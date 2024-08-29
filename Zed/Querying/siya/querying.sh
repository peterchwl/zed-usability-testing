#!/bin/bash
while true; do
  echo -n "Enter your type of file (homo/hetero): "
  read typeoffile

  if [ "$typeoffile" == "homo" ]; then
    #FILE="../../Ingesting/siya/homogeneousingestion.zson"
    
    export ZED_LAKE="/Users/skamboj2022/Downloads/ERSP/zed-usability-testing/Zed/Ingesting/siya/homogeneousdtory"
    zed use HomogeneousData
    echo "You chose homogeneous."
    break
  elif [ "$typeoffile" == "hetero" ]; then
    #FILE="../../Ingesting/siya/heterogeneousingestion.zson"
    
    export ZED_LAKE="/Users/skamboj2022/Downloads/ERSP/zed-usability-testing/Zed/Ingesting/siya/heterogeneousdtory"
    zed use HeterogeneousData
    echo "You chose heterogeneous."
    break
  else
    echo "Invalid input. Please enter 'homo' or 'hetero'."
  fi
done

echo "Search query 1"
zed query -z 'ts==2018-03-24T17:15:21.196410Z' >  "query_results"/$typeoffile"geneous_results/search1.ndjson"

echo "Search query 2" #may need to possibly change 
#zed query -f zson '_path=="http"' > $typeoffile"geneous_results/search2.ndjson"
zed query -z 'typeof(this)==<http>' > "query_results"/$typeoffile"geneous_results/search2.ndjson"

echo "Search query 3"
zed query -z '10.47.5.155' > "query_results"/$typeoffile"geneous_results/search3.ndjson"

echo "Analytical Query 1" 
zed query -z 'typeof(this) | sort | uniq' > "query_results"/$typeoffile"geneous_results/analytical1.txt"

echo "Analytical Query 2" 
zed query -z 'count() by typeof(this) | sort | uniq' > "query_results"/$typeoffile"geneous_results/analytical2.txt"

echo "Analytical Query 3"
zed query -z 'avg(response_body_len)' > "query_results"/$typeoffile"geneous_results/analytical3.txt"

# echo "Search query 1"
# zq -f zson 'ts==2018-03-24T17:15:21.196410Z' $FILE > $typeoffile"geneous_results/search1.ndjson"

# echo "Search query 2"
# zq -f zson '_path=="http"' $FILE > $typeoffile"geneous_results/search2.ndjson"

# echo "Search query 3"
# zq -f zson 'id.orig_h==10.47.5.155' $FILE > $typeoffile"geneous_results/search3.ndjson"

# echo "Analytical Query 1"
# zq -f zson 'by _path' $FILE > $typeoffile"geneous_results/analytical1.txt"

# echo "Analytical Query 2"
# zq -f zson 'count(_path) by _path' $FILE > $typeoffile"geneous_results/analytical2.txt"

# echo "Analytical Query 3"
# zq -f zson 'avg(response_body_len)' $FILE > $typeoffile"geneous_results/analytical3.txt"