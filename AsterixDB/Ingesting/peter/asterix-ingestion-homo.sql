DROP DATAVERSE HomogeneousData IF EXISTS;
CREATE DATAVERSE HomogeneousData;
USE HomogeneousData;
CREATE TYPE FileType AS open {};
create external dataset HomogeneousDataset(FileType)
using localfs
(
    ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/test-homogeneous.ndjson"),
    ("format"="json")
);