import json

with open("../zed-sample-data-main/zeek-ndjson/ssh.ndjson", "r") as f:
    #save it line by line
    data = [json.loads(l) for l in f.readlines()]

with open("data2.json", "w") as f:
    json.dump(data, f)
