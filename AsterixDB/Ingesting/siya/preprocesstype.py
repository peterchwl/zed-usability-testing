import ndjson
file="heterogeneous"
homo_file="../../../DataSet/NDJSON_FILES/" + file + ".ndjson"
data=[]
with open(homo_file, "r") as f:
    data = [ndjson.loads(l) for l in f.readlines()]
for x in data:
    first_field_key = x[0]['_path']
    filename = f"ingestionFiles/{file}/{first_field_key}.ndjson"
    with open(filename, "a") as f:
        ndjson.dump(x, f)
        f.write('\n')       