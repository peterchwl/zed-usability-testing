#!/bin/bash

HOMOFILE="../../../JSON/Ingesting/siya/siya_homo_data.ndjson"
#HETEROFILE="../../../DataSet/heterogeneous.ndjson"
HETEROFILE="../../../JSON/Ingesting/siya/siya_hetero_data.ndjson"

echo "Homogeneous"
echo "Search query 1"
jq 'select(.uid=="CaKOs227hSLbREtxq8")' $HOMOFILE > "homogeneous_results/search1.txt"

echo "Search query 2"
jq 'select(._path=="ssl")' $HOMOFILE > "homogeneous_results/search2.txt"

echo "Search query 3"
jq 'select(.uid=="CaKOs227hSLbREtxq8")' $HOMOFILE > "homogeneous_results/search3.txt"

echo "Analytical query 1"
jq '._path' $HOMOFILE | sort -u > "homogeneous_results/analytical1.txt"

echo "Analytical query 2"
jq 'select(.proto=="tcp") ' $HOMOFILE >  "homogeneous_results/analytical2.txt"

echo "Analytical query 3"
jq -s 'map(.response_body_len) | add/length' $HOMOFILE  > "homogeneous_results/analytical3.txt"



echo "_________________________________________________________"

echo "Heterogeneous"
echo "Search query 1"
jq 'select(.uid=="CaKOs227hSLbREtxq8")' $HETEROFILE > "heterogeneous_results/search1.txt"

echo "Search query 2"
jq 'select(._path=="ssl")' $HETEROFILE > "heterogeneous_results/search2.txt"

echo "Search query 3"
jq 'select(.uid=="CaKOs227hSLbREtxq8")' $HETEROFILE > "heterogeneous_results/search3.txt"

echo "Analytical query 1"
jq '._path' $HETEROFILE | sort -u >  "heterogeneous_results/analytical1.txt"

echo "Analytical query 2"
jq 'select(.proto=="tcp")' $HETEROFILE > "heterogeneous_results/analytical2.txt"

echo "Analytical query 3"
jq -s 'map(.response_body_len) | add/length' $HETEROFILE  > "heterogeneous_results/analytical3.txt"

