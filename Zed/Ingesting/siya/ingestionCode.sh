#HETEROGENEOUS_COMPRESSED_FILE = ../../../DataSet/ZED_FILES/heterogeneous-zson.tgz
#HOMOGENEOUS_COMPRESSED_FILE = ../../../DataSet/ZED_FILES/homogeneous-zson.tgz

#tar -xvzf $HOMOGENEOUS_COMPRESSED_FILE

rm -r homogeneousdtory
rm homogeneousingestion.zson
rm -r heterogeneousdtory
rm heterogeneousingestion.zson

export ZED_LAKE=./homogeneousdtory
zed init
zed create HomogeneousData
#zed use HomogeneousData
cat ../../../DataSet/ZED_FILES/homogeneous.zson | zed load -use HomogeneousData - # ingest homogeneous.zson into first pool
#zed load ../../../DataSet/ZED_FILES/homogeneous.zson
#zed query -f zson "from HomogeneousData" > homogeneousingestion.zson


#tar -xvzf $HETEROGENEOUS_COMPRESSED_FILE
export ZED_LAKE=./heterogeneousdtory
zed init
zed create HeterogeneousData
zed use HeterogeneousData
zed load ../../../DataSet/ZED_FILES/heterogeneous.zson
#zed query -f zson "from HeterogeneousData" > heterogeneousingestion.zson

# validity check for making sure data is ingested properly
diff <(sort homogeneousingestion.zson) <(sort ../../../DataSet/ZED_FILES/homogeneous.zson)
echo "Done with homogeneous"
diff <(sort heterogeneousingestion.zson) <(sort ../../../DataSet/ZED_FILES/heterogeneous.zson)

