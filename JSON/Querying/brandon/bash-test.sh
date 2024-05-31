FILE="homogeneous.ndjson"
echo "Homogeneous Query Test"
echo "Search Query #1"
jq -c 'select(.ts=="2018-03-24T17:15:21.196410Z")' $FILE > query_results/homogeneous_results/search1.ndjson
echo "Search Query #2"
jq -c 'select(._path=="http")' $FILE > query_results/homogeneous_results/search2.ndjson

# work on this
echo "Search Query #3"
#  jq 'select(."id.orig_h" =="10.47.5.155")' $FILE > homogeneous/search3.txt
jq -c 'select(.[]| tostring | contains("10.47.5.155"))' $FILE > query_results/homogeneous_results/search3.ndjson

echo "Analytical Query #1"
jq -s 'map(._path) | unique' $FILE > query_results/homogeneous_results/analy1.txt


echo "Analytical Query #2"
jq -r '._path' $FILE |sort|uniq -c |perl -lane 'print "$F[1] $F[0]"' > query_results/homogeneous_results/analy2.txt

echo "Analytical Query #3"
jq -s 'map(select(.response_body_len!=null).response_body_len)|add/length' $FILE > query_results/homogeneous_results/analy3.txt

FILE="heterogeneous.ndjson"
echo "Heterogeneous Query Test"
echo "Search Query #1"
jq -c 'select(.ts=="2018-03-24T17:15:21.196410Z")' $FILE > query_results/heterogeneous_results/search1.ndjson
echo "Search Query #2"
jq -c 'select(._path=="http")' $FILE > query_results/heterogeneous_results/search2.ndjson

#work on this one
echo "Search Query #3"
jq -c 'select(.[]| tostring | contains("10.47.5.155"))'  $FILE > query_results/heterogeneous_results/search3.ndjson

echo "Analytical Query #1"
jq -s 'map(._path) | unique' $FILE > query_results/heterogeneous_results/analy1.txt

echo "Analytical Query #2"
#  jq -s 'map(select(._path=="http"))|length' $FILE
jq -r '._path' $FILE |sort|uniq -c |perl -lane 'print "$F[1] $F[0]"' > query_results/heterogeneous_results/analy2.txt
#  jq 'select(."_path" !=null)|."_path"' Query\ Tests/heterogeneous.ndjson |sort|uniq -c|awk '{print $2, $1}'
#  jq 'select(._path)|._path' Query\ Tests/heterogeneous.ndjson |uniq -c|awk '{print $2, $1}'
#  jq 'select(._path).["_path"]' Query\ Tests/heterogeneous.ndjson |uniq -c|awk '{print $2, $1}'
#  jq 'select(._path).["_path"]' Query\ Tests/heterogeneous.ndjson |uniq -c
#  jq 'select(._path).["_path"]' Query\ Tests/heterogeneous.ndjson |uniq -c|perl -lane 'print "$F[1] $F[0]"'
#  jq -r '._path' Query\ Tests/heterogeneous.ndjson |sort|uniq -c |perl -lane 'print "$F[1] $F[0]"'
echo "Analytical Query #3"
jq -s 'map(select(.response_body_len!=null).response_body_len)|add/length' $FILE > query_results/heterogeneous_results/analy3.txt