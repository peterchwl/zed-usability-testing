import json
import os


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
data_list_subset = []

# create a list containing all ndjson file paths
path_list = get_all_file_paths("../zeek-ndjson")
file_line_len = 0
total = 0
for path in path_list:
    with open(path, 'r') as file:
        file_line_len = 0
        for line in file:
            # Load each line as a JSON object and append it to the list
            data = json.loads(line)
            data_list.append(data)
            file_line_len += 1
        total += file_line_len
        print(path, file_line_len)

    record_size = 2
    for i in range(record_size):
        data_list_subset.append(data_list[i])
    data_list.clear()
print('total:', total)
with open("../Query Tests/heterogeneous.ndjson", 'w') as f:
    for i in range(len(data_list_subset)):
        json.dump(data_list_subset[i], f)
        f.write('\n')

# Random temporary notes
'''
import json

# Step 1: Open the existing JSON file
file_path = 'your_existing_file.json'

# Step 2: Load the existing data
with open(file_path, 'r') as file:
    existing_data = json.load(file)

# Step 3: Add new data to the loaded data
new_data = {
    "key1": "value1",
    "key2": "value2",
    # Add more key-value pairs as needed
}

existing_data.update(new_data)

# Step 4: Write the updated data back to the JSON file
with open(file_path, 'w') as file:
    json.dump(existing_data, file, indent=2)  # Use indent for pretty formatting (optional)
'''
