FILE="./homogeneous.ndjson"
echo "Homogeneous Query Test" 
echo "Search Query #1" 
jq 'select(.ts=="2018-03-24T17:15:20.724520Z")' $FILE 
echo "Search Query #2" 
jq 'select(._path=="http")' $FILE

# work on this
echo "Search Query #3" 
jq 'select(.uid=="CtjiRy1Vg3BeSeMNo1")' $FILE 

echo "Analytical Query #1" 
jq -s 'map(._path) | unique' $FILE 


echo "Analytical Query #2" 
jq -r '._path' $FILE |sort|uniq -c |perl -lane 'print "$F[1] $F[0]"'

echo "Analytical Query #3" 
jq -s 'map(.response_body_len)|add/length' $FILE

FILE="./heterogeneous.ndjson"
echo "Heterogeneous Query Test" 
echo "Search Query #1" 
jq 'select(.ts=="2018-03-24T17:15:20.724520Z")' $FILE 
echo "Search Query #2" 
jq 'select(._path=="http")' $FILE

#work on this one
echo "Search Query #3" 
jq 'select(.uid == "FWEbQU2hjPd6qmioAc" or .fuid == "FWEbQU2hjPd6qmioAc" or .id =="FWEbQU2hjPd6qmioAc")' $FILE 

echo "Analytical Query #1" 
jq -s 'map(._path) | unique' $FILE 

echo "Analytical Query #2" 
jq -s 'map(select(._path=="http"))|length' $FILE
jq -r '._path' $FILE |sort|uniq -c |perl -lane 'print "$F[1] $F[0]"'
#  jq 'select(."_path" !=null)|."_path"' Query\ Tests/heterogeneous.ndjson |sort|uniq -c|awk '{print $2, $1}'
#  jq 'select(._path)|._path' Query\ Tests/heterogeneous.ndjson |uniq -c|awk '{print $2, $1}'
#  jq 'select(._path).["_path"]' Query\ Tests/heterogeneous.ndjson |uniq -c|awk '{print $2, $1}'
#  jq 'select(._path).["_path"]' Query\ Tests/heterogeneous.ndjson |uniq -c
#  jq 'select(._path).["_path"]' Query\ Tests/heterogeneous.ndjson |uniq -c|perl -lane 'print "$F[1] $F[0]"'
#  jq -r '._path' Query\ Tests/heterogeneous.ndjson |sort|uniq -c |perl -lane 'print "$F[1] $F[0]"'
echo "Analytical Query #3" 
jq -s 'map(.response_body_len)|add/length' $FILE 