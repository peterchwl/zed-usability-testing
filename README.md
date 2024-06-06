# Testing the Usability of Different Data Models
## Zed, JSON, SQlite3, AsterixDB
### by Brandon Panuco, Peter Lee, Ruiping Fang, Siya Kamboj
### Advised by Professor Ousterhout

Poster: https://drive.google.com/file/d/17ushNm-lAFBvZiGtFMGdoHgUIWbw9oGM/view?usp=sharing

Statement of Research: https://docs.google.com/document/d/1912CkoPGAOaLGWRwpE6kEqFS71FA3dD3_cs0WnFB4t0/edit?usp=sharing

Documentation: https://docs.google.com/document/d/1qwhfSx-PWFFQyLb90sgwGxYoLw_F6_-HLOG5riZQlKo/edit?usp=sharing

This is how the directory is broken up:
```md
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
