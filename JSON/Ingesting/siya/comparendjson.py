import ndjson
import json
import difflib

def compare_ndjson_files(file1_path, file2_path):
    # Read the contents of the NDJSON files
    with open(file1_path, 'r') as file1:
        ndjson_content1 = ndjson.load(file1)
        #ndjson_content1 = [ndjson.loads(line) for line in file1]
        #ndjson_content1 = ndjson.loads(file1.read())
        #text1 = file1.readlines()
        
    with open(file2_path, 'r') as file2:
        ndjson_content2 = ndjson.load(file2)
        #ndjson_content2 = [ndjson.loads(line) for line in file2]
        #ndjson_content2 = ndjson.loads(file2.read())
        #text2 = file2.readlines()

    # Compute the diff
    differ = difflib.Differ()
    diff = list(differ.compare(ndjson.dumps(ndjson_content1, default=str).splitlines(), ndjson.dumps(ndjson_content2, default=str).splitlines()))

    # Print or process the differences
    for line in diff:
        print(line)



# Example usage
official_hetero_file="../../../DataSet/heterogeneous.ndjson"
official_homo_file="../../../DataSet/homogeneous.ndjson"

siya_hetero_file="siya_hetero_data.ndjson"
siya_homo_file="siya_homo_data.ndjson"


compare_ndjson_files(official_homo_file, siya_homo_file)
#compare_ndjson_files(official_homo_file, official_hetero_file)