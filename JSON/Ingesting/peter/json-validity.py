import json
import sys

file = input("File: ")
if file != "homogeneous" and file != "heterogeneous" and file != "homogeneous_half" and file != "heterogeneous_half":
    print("Please enter a valid file")
    sys.exit()

## check validity ingestion
dataset_actual = []
dataset_ingested = []
print(str(file).upper() + ": ------------------------")
with open(str(file) + ".ndjson", "r") as f:
    for l in f:
        dataset_actual.append(json.loads(l))
with open("./database/test-" + str(file) + ".ndjson", "r") as f:
    for l in f:
        dataset_ingested.append(json.loads(l))

print("Length Actual: " + str(len(dataset_actual)))
print("Length Ingested: " + str(len(dataset_ingested)))
if len(dataset_actual) == len(dataset_ingested):
    isSame = True
    for i in range(len(dataset_actual)):
        if dataset_actual[i] != dataset_ingested[i]:
            print("Error at record " + str(i) + ".")
            isSame = False
    if isSame:
        print("Datasets are the same!")
else:
    print("Length of datasets don't match.")