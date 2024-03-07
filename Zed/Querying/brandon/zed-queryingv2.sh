export ZED_LAKE="C:/ucsd/Winter-2024/CSE 198/Zed/Ingestion/data-ingestion"

zed use homogeneous_full
echo "Homogeneous Query Test"
echo "Search Query #1"
zed query -z 'ts==2018-03-24T17:15:21.196410Z' > homogeneous/search1.txt

echo "Search Query #2" 
#zed query -z '_path=="http"' > homogeneous/search2.txt
zed query -z 'typeof(this)==<http>' > homogeneous/search2.txt

echo "Search Query #3"
zed query -z '10.47.5.155' > homogeneous/search3.txt

echo "Analytical Query #1" 
#zed query -z 'by _path | sort' > homogeneous/analytic1.txt
zed query -z 'typeof(this) | sort | uniq' > homogeneous/analytic1.txt

echo "Analytical Query #2" 
#zed query -z 'count(_path) by _path | sort' > homogeneous/analytic2.txt
zed query -z 'count(typeof(this)) by _path | sort' > homogeneous/analytic2.txt

echo "Analytical Query #3"
zed query -z 'avg(response_body_len)' > homogeneous/analytic3.txt

zed use heterogeneous_full
echo "Heterogeneous Query Test"
echo "Search Query #1"
zed query -z 'ts==2018-03-24T17:15:21.196410Z' > heterogeneous/search1.txt

echo "Search Query #2" 
#zed query -z '_path=="http"' > heterogeneous/search2.txt
zed query -z 'typeof(this)==<http>' > heterogeneous/search2.txt

echo "Search Query #3"
zed query -z '10.47.5.155' > heterogeneous/search3.txt

echo "Analytical Query #1" 
#zed query -z 'by _path | sort' > homogeneous/analytic1.txt
zed query -z 'typeof(this) | sort | uniq' > heterogeneous/analytic1.txt

echo "Analytical Query #2" 
#zed query -z 'count(_path) by _path | sort' > homogeneous/analytic2.txt
zed query -z 'count(typeof(this)) by _path | sort' > heterogeneous/analytic2.txt

echo "Analytical Query #3"
zed query -z 'avg(response_body_len)' > heterogeneous/analytic3.txt
