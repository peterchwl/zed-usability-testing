import ndjson
hetero_file="../../../DataSet/heterogeneous.ndjson"
homo_file="../../../DataSet/homogeneous.ndjson"

with open(homo_file, "r") as f:
    data = [ndjson.loads(l) for l in f.readlines()]
with open("siya_homo_data.ndjson", "w") as f:
    for x in data:
        ndjson.dump(x, f)
        f.write('\n')

with open(hetero_file, "r") as f:
    data = [ndjson.loads(l) for l in f.readlines()]
with open("siya_hetero_data.ndjson", "w") as f:
    for x in data:
        ndjson.dump(x, f)
        f.write('\n')
