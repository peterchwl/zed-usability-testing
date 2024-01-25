import json
import os

if __name__ == '__main__':


    folder = '/Users/iris-fang/Documents/code/zed-usability-testing/DataSet'

    for root, folders, filenames in os.walk(folder):
        for filename in filenames:
            if filename.endswith('.ndjson'):
                res = []
                with open(os.path.join(folder,filename)) as file:
                    for line in file:
                        res.append(line)
                with open(filename, 'w' ) as file:
                    for line in res:
                        file.write(line)















