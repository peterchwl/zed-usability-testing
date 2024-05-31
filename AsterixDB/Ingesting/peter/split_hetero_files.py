import json
import os

def group_ndjson_records_by_path(input_file):
    # Dictionary to hold groups of records by _path value
    grouped_records = {}
    
    # Read the NDJSON records from the input file
    with open(input_file, 'r') as file:
        for line in file:
            record = json.loads(line)
            path_value = record.get('_path')
            if path_value:
                if path_value not in grouped_records:
                    grouped_records[path_value] = []
                grouped_records[path_value].append(record)
    
    # Create output NDJSON files for each group
    for path_value, records in grouped_records.items():
        output_file = f"./database/hetero/{path_value}.ndjson"
        with open(output_file, 'w') as file:
            for record in records:
                file.write(json.dumps(record) + '\n')
    
    print("Files created successfully.")

# Example usage
input_file = './database/test-heterogeneous.ndjson'  # Change this to the path of your input NDJSON file
group_ndjson_records_by_path(input_file)
