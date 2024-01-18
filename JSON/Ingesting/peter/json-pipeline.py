import gzip
import json
import os

## homoegenous pipeline
dataset = []
with open("homogeneous.json", "r") as f:
    dataset = json.load(f)
with open("test-homogeneous.json", "w") as f:
    json.dump(dataset, f)
    
## heterogeneous pipeline
dataset = []
with open("heterogeneous.json", "r") as f:
    dataset = json.load(f)
with open("test-heterogeneous.json", "w") as f:
    json.dump(dataset, f)
