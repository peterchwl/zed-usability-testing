import json

data_list = []
first_half = []
second_half = []
half = 0


# FULL LIST LOADING
def load_everything(path):
    data_list.clear()
    with open(path, 'r') as file:
        for line in file:
            data = json.loads(line)
            data_list.append(data)
    print(f'File Object Size: {len(data_list)}')


path = "../Query Tests/homogeneous.ndjson"
load_everything(path)
half = len(data_list) // 2


# Test Function
def tester(half_list, starting_point, end_point):
    success_count: int = 0
    for index in range(starting_point, end_point):
        if half_list[success_count] != data_list[index]:
            print(f'Failed to Ingest Object {index} from {path}')
            break
        success_count += 1
    if starting_point == 0:
        print(f'First Half Success Rate: {success_count / half * 100.0}%')
    elif starting_point == half:
        print(f'Second Half Success Rate: {success_count / (len(data_list) - half) * 100.0}%')


# FIRST HALF LOADING
with open(path, 'r') as file:
    for line in file:
        if len(first_half) != len(data_list) // 2:
            data = json.loads(line)
            first_half.append(data)
        else:
            file.close()
            break

# SECOND HALF LOADING
with open(path, 'r') as file:
    object_counter = 1
    for line in file:
        if object_counter > half:
            data = json.loads(line)
            second_half.append(data)
        object_counter += 1

print(len(second_half), len(first_half), len(second_half) + len(first_half))
# TESTS
tester(first_half, 0, half)
tester(second_half, half, len(data_list))


# ACTUAL INGESTION TEST
def ingestion_tester(path):
    with open(path, 'w') as f:
        for i in range(half):
            json.dump(data_list[i], f)
            f.write('\n')

    first_half.clear()
    with open(path, 'r') as file:
        for line in file:
            data = json.loads(line)
            first_half.append(data)

    tester(first_half, 0, half)
    first_half.clear()


print('Homogeneous-Half')
path = "../Query Tests/homogeneous.ndjson"
load_everything(path)
half = len(data_list) // 2
path = "homogeneous-half.ndjson"
ingestion_tester(path)

print('Heterogeneous-Half')
path = "../Query Tests/heterogeneous.ndjson"
load_everything(path)
half = len(data_list) // 2
path = "heterogeneous-half.ndjson"
ingestion_tester(path)

# Dump results
print('Heterogeneous-Full')
path = "../Query Tests/heterogeneous.ndjson"
load_everything(path)
half = len(data_list)
path = "heterogeneous-full.ndjson"
ingestion_tester(path)

print('Homogeneous-Full')
path = "../Query Tests/homogeneous.ndjson"
load_everything(path)
half = len(data_list)
path = "homogeneous-full.ndjson"
ingestion_tester(path)