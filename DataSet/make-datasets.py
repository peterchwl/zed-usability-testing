import gzip
import json
import os
import random

## create homogenous set
f = gzip.open("./zeek-ndjson/http.ndjson.gz")
dataset = []
for l in f:
    dataset.append(json.loads(l))   
with open("homogeneous.ndjson", "w", encoding="utf-8") as f:
    for i in range(len(dataset)):
        json.dump(dataset[i], f)
        f.write('\n')
        
with open("homogeneous_half.ndjson", "w", encoding="utf-8") as f:
    for i in range(len(dataset)//2):
        json.dump(dataset[i], f)
        f.write('\n')
        
print("Size of homogeneous file: " + str(len(dataset)) + " records.")
print("Size of homogeneous half file: " + str(len(dataset)//2) + " records.")

## create heterogeneous set
total_records = 1462078
percent_of_db = len(dataset) / total_records

dataset = []
for filename in os.listdir("zeek-ndjson"):
    currDataset = []
    # print(os.path.join("zeek-ndjson", filename))
    f = gzip.open(os.path.join("zeek-ndjson", filename))
    for l in f:
        rand = random.randint(0,100)
        if rand <= percent_of_db * 100:
            currDataset.append(json.loads(l))
    dataset += currDataset

with open("heterogeneous.ndjson", "w") as f:
    for i in range(len(dataset)):
        json.dump(dataset[i], f)
        f.write('\n')

with open("heterogeneous_half.ndjson", "w") as f:
    for i in range(len(dataset)//2):
        json.dump(dataset[i], f)
        f.write('\n')

print("Size of heterogeneous file: " + str(len(dataset)) + " records.")
print("Size of heterogeneous half file: " + str(len(dataset)//2) + " records.")
