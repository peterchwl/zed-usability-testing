# ingest data
export ZED_LAKE=./database
zed init
zed create homogeneous
zed create heterogeneous
zed load -use homogeneous homogeneous.zson
zed load -use heterogeneous heterogeneous.zson