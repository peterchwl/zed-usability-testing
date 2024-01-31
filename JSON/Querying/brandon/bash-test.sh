FILE="../../../JSON/Ingesting/brandon/homogeneous-full.ndjson"
echo "Homogeneous Query Test" 
echo "Search Query #1" 
jq 'select(.ts=="2018-03-24T17:15:20.724520Z")' $FILE > homogeneous/search1.txt
echo "Search Query #2" 
jq 'select(._path=="http")' $FILE > homogeneous/search2.txt

# work on this
echo "Search Query #3" 
jq 'select(.uid=="CtjiRy1Vg3BeSeMNo1")' $FILE > homogeneous/search3.txt

echo "Analytical Query #1" 
jq -s 'map(._path) | unique' $FILE > homogeneous/analy1.txt


echo "Analytical Query #2" 
jq -r '._path' $FILE |sort|uniq -c |perl -lane 'print "$F[1] $F[0]"' $FILE > homogeneous/analy2.txt

echo "Analytical Query #3" 
jq -s 'map(.response_body_len)|add/length' $FILE > homogeneous/analy3.txt

FILE="../../../JSON/Ingesting/brandon/heterogeneous-full.ndjson"
echo "Heterogeneous Query Test" 
echo "Search Query #1" 
jq 'select(.ts=="2018-03-24T17:15:20.724520Z")' $FILE > heterogeneous/search1.txt
echo "Search Query #2" 
jq 'select(._path=="http")' $FILE > heterogeneous/search2.txt

#work on this one
echo "Search Query #3" 
jq 'select(.uid == "FWEbQU2hjPd6qmioAc" or .fuid == "FWEbQU2hjPd6qmioAc" or .id =="FWEbQU2hjPd6qmioAc")' $FILE > heterogeneous/search3.txt

echo "Analytical Query #1" 
jq -s 'map(._path) | unique' $FILE > heterogeneous/analy1.txt

echo "Analytical Query #2" 
#  jq -s 'map(select(._path=="http"))|length' $FILE
jq -r '._path' $FILE |sort|uniq -c |perl -lane 'print "$F[1] $F[0]"' $FILE > heterogeneous/analy2.txt
#  jq 'select(."_path" !=null)|."_path"' Query\ Tests/heterogeneous.ndjson |sort|uniq -c|awk '{print $2, $1}'
#  jq 'select(._path)|._path' Query\ Tests/heterogeneous.ndjson |uniq -c|awk '{print $2, $1}'
#  jq 'select(._path).["_path"]' Query\ Tests/heterogeneous.ndjson |uniq -c|awk '{print $2, $1}'
#  jq 'select(._path).["_path"]' Query\ Tests/heterogeneous.ndjson |uniq -c
#  jq 'select(._path).["_path"]' Query\ Tests/heterogeneous.ndjson |uniq -c|perl -lane 'print "$F[1] $F[0]"'
#  jq -r '._path' Query\ Tests/heterogeneous.ndjson |sort|uniq -c |perl -lane 'print "$F[1] $F[0]"'
echo "Analytical Query #3" 
jq -s 'map(.response_body_len)|add/length' $FILE > heterogeneous/analy3.txt