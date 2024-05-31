read -p "File: " user_input

if [ "$user_input" != "homogeneous" ] && [ "$user_input" != "heterogeneous" ]; then
    echo "Invalid file!"
    exit 1
fi

filepath_out="./query_results/"$user_input"_queries"

export ZED_LAKE=./database

zed use $user_input
# zed query 'from homogeneous | ts==2018-03-24T17:15:21.196410Z'
zed query -f json 'ts==2018-03-24T17:15:21.196410Z' > $filepath_out/search1.ndjson
zed query -f json 'typeof(this)==<http>' > $filepath_out/search2.ndjson
# zed query -f json 'id.orig_h==10.47.5.155' > $filepath_out/query3.ndjson
zed query -f json '10.47.5.155' > $filepath_out/search3.ndjson

zed query -f json 'typeof(this) | sort | uniq' > $filepath_out/analytical1.txt
zed query -f json 'count() by typeof(this) | sort | uniq' > $filepath_out/analytical2.txt
zed query -f json 'avg(response_body_len)' > $filepath_out/analytical3.txt