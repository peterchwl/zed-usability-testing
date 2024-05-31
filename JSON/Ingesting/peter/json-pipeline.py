import json
import sys

file = input("File: ")
if file != "homogeneous" and file != "heterogeneous" and file != "homogeneous_half" and file != "heterogeneous_half":
    print("Please enter a valid file")
    sys.exit()

dataset = []
with open(str(file) + ".ndjson", "r") as f:
    for l in f:
        dataset.append(json.loads(l))
     
with open("./database/test-" + str(file) + ".ndjson", "w") as f:
    for i in range(len(dataset)):
        json.dump(dataset[i], f)
        f.write('\n')