# ingest data
export ZED_LAKE=./database_half
zed init
zed create homogeneous_half
zed create heterogeneous_half
zed load -use homogeneous_half homogeneous_half.zson
zed load -use heterogeneous_half heterogeneous_half.zson

# validate data
zed query -f zson 'from homogeneous_half' > homogeneous_half_valid_ingest.zson
diff <(sort homogeneous_half_valid_ingest.zson) <(sort homogeneous_half.zson) > homogeneous_results.txt

zed query -f zson 'from heterogeneous_half' > heterogeneous_half_valid_ingest.zson
diff <(sort heterogeneous_half_valid_ingest.zson) <(sort heterogeneous_half.zson) > heterogeneous_results.txt

# delete data
rm -rf database_half
rm homogeneous_half_valid_ingest.zson
rm heterogeneous_half_valid_ingest.zson

# NOTE anything outside of the bashscript does not work outside such as zed queries