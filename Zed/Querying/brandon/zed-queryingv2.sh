export ZED_LAKE="C:/ucsd/Winter-2024/CSE 198/Zed/Ingestion/data-ingestion"

zed use homogeneous_full
echo "Homogeneous Query Test"
echo "Search Query #1"
zed query -f json 'ts==2018-03-24T17:15:21.196410Z' > query_results/homogeneous_results/search1.ndjson

echo "Search Query #2" 
#zed query -z '_path=="http"' > homogeneous/search2.txt
zed query -f json 'typeof(this)==<http>' > query_results/homogeneous_results/search2.ndjson

echo "Search Query #3"
zed query -f json '10.47.5.155' > query_results/homogeneous_results/search3.ndjson

echo "Analytical Query #1" 
#zed query -z 'by _path | sort' > homogeneous/analytic1.txt
zed query -f json 'typeof(this) | sort | uniq' > query_results/homogeneous_results/analytical1.ndjson

echo "Analytical Query #2" 
#zed query -z 'count(_path) by _path | sort' > homogeneous/analytic2.txt
zed query -f json 'count(typeof(this)) by typeof(this) | sort' > query_results/homogeneous_results/analytical2.ndjson

echo "Analytical Query #3"
zed query -f json 'avg(response_body_len)' > query_results/homogeneous_results/analytical3.ndjson

zed use heterogeneous_full
echo "Heterogeneous Query Test"
echo "Search Query #1"
zed query -f json 'ts==2018-03-24T17:15:21.196410Z' > query_results/heterogeneous_results/search1.ndjson

echo "Search Query #2" 
#zed query -z '_path=="http"' > heterogeneous/search2.txt
zed query -f json 'typeof(this)==<http>' > query_results/heterogeneous_results/search2.ndjson

echo "Search Query #3"
zed query -f json '10.47.5.155' > query_results/heterogeneous_results/search3.ndjson

echo "Analytical Query #1" 
#zed query -z 'by _path | sort' > homogeneous/analytic1.txt
zed query -f json 'typeof(this) | sort | uniq' > query_results/heterogeneous_results/analytical1.ndjson

echo "Analytical Query #2" 
#zed query -z 'count(_path) by _path | sort' > homogeneous/analytic2.txt
# zed query -f json 'count(typeof(this)) by _path | sort' > query_results/heterogeneous_results/analytic2.ndjson
zed query -f json 'count(typeof(this)) by typeof(this) | sort' > query_results/heterogeneous_results/analytical2.ndjson

echo "Analytical Query #3"
zed query -f json 'avg(response_body_len)' > query_results/heterogeneous_results/analytical3.ndjson
