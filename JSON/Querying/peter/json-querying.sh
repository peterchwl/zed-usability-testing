read -p "File: " user_input

if [ "$user_input" != "homogeneous" ] && [ "$user_input" != "heterogeneous" ]; then
    echo "Invalid file!"
    exit 1
fi

echo test-$user_input
filepath_in="./database/test-$user_input.ndjson"
filepath_out="./query_results/${user_input}_queries"

echo Query 1 Done
jq -c 'select(.ts == "2018-03-24T17:15:21.196410Z")' $filepath_in > $filepath_out/search1.ndjson
# QUERY BY TYPE
echo Query 2 FAILED
# jq -c 'select(._path == "http")' $filepath_in > $filepath_out/search2.ndjson
echo Query 3 Done
jq -c 'select(.[] | tostring | contains("10.47.5.155"))' $filepath_in > $filepath_out/search2.ndjson
# QUERY BY TYPE
echo Query 4 FAILED
# jq '.["_path"]' $filepath_in | sort -u > $filepath_out/analytical1.txt
# QUERY BY TYPE
echo Query 5 FAILED
# jq '.["_path"]' $filepath_in | sort | uniq -c > $filepath_out/analytical2.txt
echo Query 6 Done
# jq 'select(.response_body_len != null) | .response_body_len' $filepath_in | awk '{ sum += $1 } END { if (NR > 0) print sum / NR }' > $filepath_out/analytical3.txt
jq -s 'map(select(.response_body_len != null) .response_body_len)|add/length' $filepath_in > $filepath_out/analytical3.txt



# SQ1
# SQ2
# AQ3

# SQ3-- we neet to change status code -> ip address b/c we want a heterogeneous output and status code may only be limited to http (according to ousterhout)
# AQ2-- change the query entirely, we want to get the amount of each _path/type there are (i.e. http 144,000)
