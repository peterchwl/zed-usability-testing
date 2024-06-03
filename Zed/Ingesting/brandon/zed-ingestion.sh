export ZED_LAKE=./data-ingestion # create lake
zed init 
zed create homogeneous_full # create first pool
cat zed-dataset/homogeneous.zson | zed load -use homogeneous_full - # ingest homogeneous.zson into first pool
zed create heterogeneous_full # create second pool
cat zed-dataset/heterogeneous.zson | zed load -use heterogeneous_full - # ingest heterogeneous.zson into second pool

zed query -f zson "from homogeneous_full" > homogeneous_full_z.zson # query homogeneous pool and output into homogeneous_full_z.zson
zed query -f zson "from heterogeneous_full" > heterogeneous_full_z.zson # query heterogeneous pool and output into heterogeneous_full_z.zson

zed create homogeneous_half
cat zed-dataset/homogeneous_half.zson | zed load -use homogeneous_half - 
zed create heterogeneous_half
cat zed-dataset/heterogeneous_half.zson | zed load -use heterogeneous_half - 

zed query -f zson "from homogeneous_half" > homogeneous_half_z.zson 
zed query -f zson "from heterogeneous_half" > heterogeneous_half_z.zson 

#zed drop homogeneous_full
#zed drop heterogeneous_full 
#zed drop homogeneous_half
#zed drop heterogeneous_half 
# zq -f zson heterogeneous_full_z.zng > some-file.zson
#diff <(sort homogeneous_full_z.zson) <(sort zed-dataset/homogeneous.zson)
#diff <(sort heterogeneous_full_z.zson) <(sort zed-dataset/heterogeneous.zson)

if diff <(sort homogeneous_half_z.zson) <(sort zed-dataset/homogeneous_half.zson) &> /dev/null; then
    echo "Files homogeneous_half_z.zson and zed-dataset/homogeneous_half.zson are the same"
else
    echo "Files homogeneous_half_z.zson and zed-dataset/homogeneous_half.zson are different"
fi

if diff <(sort heterogeneous_half_z.zson) <(sort zed-dataset/heterogeneous_half.zson) &> /dev/null; then
    echo "Files heterogeneous_half_z.zson and zed-dataset/heterogeneous_half.zson are the same"
else
    echo "Files heterogeneous_half_z.zson and zed-dataset/heterogeneous_half.zson are different"
fi

if diff <(sort homogeneous_full_z.zson) <(sort zed-dataset/homogeneous.zson) &> /dev/null; then
    echo "Files homogeneous_full_z.zson and zed-dataset/homogeneous.zson are the same"
else
    echo "Files homogeneous_full_z.zson and zed-dataset/homogeneous.zson are different"
fi

if diff <(sort heterogeneous_full_z.zson) <(sort zed-dataset/heterogeneous.zson) &> /dev/null; then
    echo "Files heterogeneous_full_z.zson and zed-dataset/heterogeneous.zson are the same"
else
    echo "Files heterogeneous_full_z.zson and zed-dataset/heterogeneous.zson are different"
fi

# NOTE anything outside of the bashscript code does not work outside such as zed queries