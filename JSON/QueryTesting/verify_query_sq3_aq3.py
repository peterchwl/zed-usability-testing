import json

FILE = "../DataSet/NDJSON_FILES/homogeneous.ndjson"
target_ip = "10.47.5.155"

total_count = 0

with open(FILE, 'r') as file:
    for line in file:
        total_count += 1
        record = json.loads(line)
        if record.get('id.orig_h') == target_ip:
            print(record)



print(f"Total number of records in the file: {total_count}")

import json

FILE = "../DataSet/NDJSON_FILES/homogeneous.ndjson"


response_body_lens = []

# Open the NDJSON file
with open(FILE, 'r') as file:
    for line in file:
        record = json.loads(line)
        if 'response_body_len' in record and record['response_body_len'] is not None:
            response_body_lens.append(record['response_body_len'])

total_len = sum(response_body_lens)

average_len = total_len / len(response_body_lens) if response_body_lens else 0

print(f"Average response_body_len: {average_len}")
