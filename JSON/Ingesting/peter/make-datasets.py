import gzip
import json
import os

## create homogenous set
f = gzip.open("./zeek-ndjson/http.ndjson.gz")
dataset = []
for l in f:
    dataset.append(json.loads(l))   
with open("homogeneous.json", "w", encoding="utf-8") as f:
    json.dump(dataset[:52], f)

print(len(dataset[:52]))

## create heterogeneous set
dataset = []
for filename in os.listdir("zeek-ndjson"):
    currDataset = []
    # print(os.path.join("zeek-ndjson", filename))
    f = gzip.open(os.path.join("zeek-ndjson", filename))
    
    for l in f:
        currDataset.append(json.loads(l))
    dataset += currDataset[:2]

with open("heterogeneous.json", "w") as f:
    json.dump(dataset, f)

print(len(dataset))        

