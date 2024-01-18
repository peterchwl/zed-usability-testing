import json

## check validity homegenous ingestion
dataset_actual = []
dataset_ingested = []
print("Homogenous: ------------------------")
with open("homogeneous.json", "r") as f:
    dataset_actual = json.load(f)
with open("test-homogeneous.json", "r") as f:
    dataset_ingested = json.load(f)

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
    
# check validity heterogeneous ingestion
dataset_actual = []
dataset_ingested = []
print("Heterogeneous: ---------------------")
with open("heterogeneous.json", "r") as f:
    dataset_actual = json.load(f)
with open("test-heterogeneous.json", "r") as f:
    dataset_ingested = json.load(f)
    
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