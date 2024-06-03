FILE="homogeneous_full_z.zson"

echo "Homogeneous Query Test"
echo "Search Query #1"
zq -z 'ts==2018-03-24T17:15:21.196410Z' $FILE > homogeneous/search1.txt

echo "Search Query #2" 
zq -z '_path=="http"' $FILE > homogeneous/search2.txt

echo "Search Query #3"
zq -z '10.47.5.155' $FILE > homogeneous/search3.txt

echo "Analytical Query #1" 
#jq -s 'map(._path) | unique' $FILE > homogeneous/analy1.txt
zq -z 'by _path | sort' $FILE > homogeneous/analytic1.txt

echo "Analytical Query #2" 
zq -z 'count(_path) by _path | sort' $FILE > homogeneous/analytic2.txt

echo "Analytical Query #3"
zq -z 'avg(response_body_len)' $FILE > homogeneous/analytic3.txt

FILE="heterogeneous_full_z.zson"

echo "Heterogeneous Query Test"
echo "Search Query #1"
zq -z 'ts==2018-03-24T17:15:21.196410Z' $FILE > heterogeneous/search1.txt

echo "Search Query #2" 
zq -z '_path=="http"' $FILE > heterogeneous/search2.txt

echo "Search Query #3"
zq -z '10.47.5.155' $FILE > heterogeneous/search3.txt

echo "Analytical Query #1" 
#jq -s 'map(._path) | unique' $FILE > homogeneous/analy1.txt
zq -z 'by _path | sort' $FILE > heterogeneous/analytic1.txt

echo "Analytical Query #2" 
zq -z 'count(_path) by _path | sort' $FILE > heterogeneous/analytic2.txt

echo "Analytical Query #3"
zq -z 'avg(response_body_len)' $FILE > heterogeneous/analytic3.txt
