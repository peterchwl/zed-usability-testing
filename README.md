# Testing the Usability of Different Data Models
## Zed, JSON, SQlite3, AsterixDB
### by Brandon Panuco, Peter Lee, Ruiping Fang, Siya Kamboj
### Advised by Professor Ousterhout

This is how the directory is broken up 
```bash
├── DATASETS : Contains our original dataset in the form of either NDJSON or Zed files. We will ingest this data into the other data models.
│   ├──NDJSON_DATA
│   │   ├── heterogeneous_half.ndjson
│   │   ├── heterogeneous.ndjson
│   │   ├── homogeneous_half.ndjson
│   │   ├── homogeneous.ndjson
│   ├── ZED_DATA
│   │   ├── heterogeneous_half.ndjson
│   │   ├── heterogeneous.ndjson
│   │   ├── homogeneous_half.ndjson
│   │   ├── homogeneous.ndjson
│   ├── make-datasets.py : This is the code we used to separate our dataset into its halves and save it into the respective folder.
├── SQLite3
│   ├── Ingestion
│   │   ├── brandon
│   │   ├── peter
│   │   ├── ruiping
│   │   ├── siya
│   ├── Querying
│   │   ├── brandon
│   │   │   ├── query_results.zip
│   │   ├── peter
│   │   │   ├── query_results.zip
│   │   ├── ruiping
│   │   │   ├── query_results.zip
│   │   ├── siya
│   │   │   ├── query_results.zip
├── AsterixDB
│   ├── Ingestion
│   │   ├── brandon
│   │   ├── peter
│   │   ├── ruiping
│   │   ├── siya
│   ├── Querying
│   │   ├── brandon
│   │   │   ├── query_results.zip
│   │   ├── peter
│   │   │   ├── query_results.zip
│   │   ├── ruiping
│   │   │   ├── query_results.zip
│   │   ├── siya
│   │   │   ├── query_results.zip
├── JSON
│   ├── Ingestion
│   │   ├── brandon
│   │   ├── peter
│   │   ├── ruiping
│   │   ├── siya
│   ├── Querying
│   │   ├── brandon
│   │   │   ├── query_results.zip
│   │   ├── peter
│   │   │   ├── query_results.zip
│   │   ├── ruiping
│   │   │   ├── query_results.zip
│   │   ├── siya
│   │   │   ├── query_results.zip
├── Zed
│   ├── Ingestion
│   │   ├── brandon
│   │   ├── peter
│   │   ├── ruiping
│   │   ├── siya
│   ├── Querying
│   │   ├── brandon
│   │   │   ├── query_results.zip
│   │   ├── peter
│   │   │   ├── query_results.zip
│   │   ├── ruiping
│   │   │   ├── query_results.zip
│   │   ├── siya
│   │   │   ├── query_results.zip
└── .gitignore
```
