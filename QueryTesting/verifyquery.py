FILE = "../DataSet/homogeneous.ndjson"; 
import json

count=0
#Verify SQ 1 : Retrieve "ts": "2018-03-24T17:15:21.196410Z" 
print("\nSQ1")
with open(FILE) as f:
    for line in f:
        record=json.loads(line)
        #print(record)
        if (record.get("ts") == "2018-03-24T17:15:21.196410Z"):
            print(record)

#Verify AQ2: list the number of different types by _path
print("\nAQ2")
paths=[]
countofpaths=[]
with open(FILE) as f:
    for line in f:
        record=json.loads(line)
        #print(record)
        if (record.get("_path") is not None):
            currPath=record.get("_path")
            if currPath in paths:
                currIndex=paths.index(currPath)
                countofpaths[currIndex] = countofpaths[currIndex] + 1
            else:
                paths.append(currPath)
                countofpaths.append(1)
totalcount=0
for index, value in enumerate(paths):
    print(f"{value}     \t {countofpaths[index]}")
    totalcount+=countofpaths[index]
print("Total count is "+ str(totalcount))


        



