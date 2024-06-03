export ZED_LAKE=./data-ingestion # create lake
zed init
zed create homogeneous_full
cat ../../../DataSet/ZED_FILES/homogeneous.zson | zed load -use homogeneous_full -
zed create heterogeneous_full
cat ../../../DataSet/ZED_FILES/heterogeneous.zson | zed load -use heterogeneous_full -

zed query -f zson "from homogeneous_full" > homogeneous_full_z.zson
zed query -f zson "from heterogeneous_full" > heterogeneous_full_z.zson

zed drop homogeneous_full
zed drop heterogeneous_full
