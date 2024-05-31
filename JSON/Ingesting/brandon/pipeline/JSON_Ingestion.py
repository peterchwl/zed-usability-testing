import json
import os
import random

data_list = []
path = "../zeek-ndjson/http.ndjson"

with open(path, 'r') as file:
    for line in file:
        data = json.loads(line)
        data_list.append(data)

num_of_records = len(data_list)
with open("../Query Tests/homogeneous.ndjson", 'w') as f:
    for i in range(num_of_records):
        json.dump(data_list[i], f)
        f.write('\n')


def get_all_file_paths(folder_path):
    file_paths = []

    # Walk through the folder and its subdirectories
    for folder_name, sub_folders, filenames in os.walk(folder_path):
        for filename in filenames:
            # Get the full path of the file
            file_path = os.path.join(folder_name, filename)
            file_paths.append(file_path)

    return file_paths


data_list = []
http_total = []

# create a list containing all ndjson file paths
path_list = get_all_file_paths("../zeek-ndjson")
for path in path_list:
    with open(path, 'r') as file:
        for line in file:
            data = json.loads(line)
            data_list.append(data)

with open("../zeek-ndjson/http.ndjson", 'r') as file:
    for line in file:
        data = json.loads(line)
        http_total.append(data)

percentage = len(http_total) / len(data_list)
print(percentage)
count = 0
with open("../Query Tests/heterogeneous.ndjson", 'w') as f:
    for i in range(len(data_list)):
        if random.randint(0, 100) <= percentage * 100:
            json.dump(data_list[i], f)
            f.write('\n')
            count += 1

