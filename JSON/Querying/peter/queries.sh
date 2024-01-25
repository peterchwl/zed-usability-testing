read -p "File: " user_input

if [ "$user_input" != "homogeneous" ] && [ "$user_input" != "heterogeneous" ]; then
    echo "Invalid file!"
    exit 1
fi

echo test-$user_input
filepath_in="./database/test-$user_input.ndjson"
filepath_out="./query-results/$user_input-queries"

echo Query 1 Done
jq -c 'select(.ts == "2018-03-24T17:15:21.196410Z")' $filepath_in > $filepath_out/query1.txt
echo Query 2 Done
jq -c 'select(._path == "http")' $filepath_in > $filepath_out/query2.txt
echo Query 3 Done
jq -c 'select(.status_code == 404)' $filepath_in > $filepath_out/query3.txt
echo Query 4 Done
jq -r '.["_path"]' $filepath_in | sort -u > $filepath_out/query4.txt
echo Query 5 Done
jq 'select(.["id.resp_p"] != null)' $filepath_in | wc -l > $filepath_out/query5.txt
echo Query 6 Done
jq -r 'select(.response_body_len != null) | .response_body_len' $filepath_in | awk '{ sum += $1 } END { if (NR > 0) print sum / NR }' > $filepath_out/query6.txt