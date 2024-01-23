import json
import gzip
import os

if __name__ == '__main__':
    # 1. list all filenames under folder
    # 2. iterate each filename
    # 3. load each line of file as a dict
    # 4. add each dict to result list

    folder = '/Users/iris-fang/Documents/code/cse193/sample-data/zed-sample-data/zeek-ndjson/'
    res = []  # initialize result list
    # 1. list folders
    for root, folders, filenames in os.walk(folder):
        print(f'found {len(filenames)} files: {filenames}')
        # 2. iterate each file
        for filename in filenames:
            print(f'parsing {filename}...')
            # 3. load each line of file as a dict
            # os.path.join() will construct path based on current OS

            if not filename.endswith('.gz'):
                continue  # skip none .gz files
            with gzip.open(os.path.join(folder, filename)) as file:
                for line in file:
                    data = json.loads(line)
                    # 4. add each dict to result list
                    res.append(data)

        # prevent os.walk reaches nested folder
        print(f'finished parsing {len(filenames)} files...')
        break

    with open('heterogeneous.json', 'w') as file:
        json.dump(res, file)
        print(f'exported to heterogeneous.json')
