import json
from difflib import unified_diff

print("This file does not work")

def read_ndjson(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        lines = file.readlines()
        return [json.loads(line) for line in lines]
    

def compare_ndjson(file1_path, file2_path):
    ndjson1 = read_ndjson(file1_path)
    ndjson2 = read_ndjson(file2_path)

    # Use unified_diff to find the differences
    diff = list(unified_diff(ndjson1, ndjson2, lineterm='', fromfile=file1_path, tofile=file2_path))

    return '\n'.join(diff)

# Example usage

peter_search1_homo="../peter/query-results/homogeneous-queries/query1.txt"
siya_search1_homo="homogeneous_results/search1.txt"

differences = compare_ndjson( siya_search1_homo, peter_search1_homo)

if differences:
    print("Differences found:")
    print(differences)
else:
    print("No differences found.")





