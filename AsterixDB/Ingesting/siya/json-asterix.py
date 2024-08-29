import json
from collections import defaultdict
import uuid
'''
paths = ["conn", "dce_rpc", "dns", "dpd", "files", "ftp", "http", "kerberos", "modbus", "notice", "ntlm", "ntp",
         "pe", "rdp", "smb_files", "smb_mapping", "smtp", "snmp", "ssh", "ssl", "syslog", "weird", "x509"]
         '''
paths = ['new_table']
file_path = "heterogeneous.ndjson"
tables = defaultdict(list)
tables2 = defaultdict(list)

for path in paths:
    tables[path]

def key_sqltype(key, data):
    if type(data[key]).__name__ == "int":
        sql_type = "int?"
    elif type(data[key]).__name__ == "float":
        sql_type = "double?"
    elif type(data[key]).__name__ == "str":
        sql_type = "string?"
    elif type(data[key]).__name__ == "list":
        sql_type = "string?"
    elif type(data[key]).__name__ == "bool":
        sql_type = "boolean?"

    return f'`{key}`: {sql_type}'

with open(file_path, "r") as json_file:
    for line in json_file:
        data = json.loads(line)
        path = data['_path']
        for key, val in data.items():
              if isinstance(val, list):
                  data[key] = json.dumps(val)
        data['unique_id'] = str(uuid.uuid4())
        tables[data['_path']].append(data)
        for key in data:
            if key not in tables2[path]:
                key_type = key_sqltype(key, data)
                tables[path].append(key_type)
                tables2[path].append(key)
'''
with open(file_path, "r") as json_file:
    for line in json_file:
        data = json.loads(line)
        path = data['_path']
        data['unique_id'] = str(uuid.uuid4())
        for key in data:
            if key not in tables2['new_table']:
                key_type = key_sqltype(key, data)
                tables['new_table'].append(key_type)
                tables2['new_table'].append(key)
'''
for path, keys_array in tables.items():
    print(f'CREATE TYPE {path} AS {{')
    for i in range(len(tables[path])):
        if (i!= len(tables[path])-1):
            print(f'{tables[path][i]},')
        else:
            print(f'{tables[path][i]}')
    print('};')
    print('CREATE DATASET {path}({path}) PRIMARY KEY `unique_id`;')
# CREATE DATASET conn(conn) PRIMARY KEY `unique_id`;

# all but conn insertion
with open("insert-into1.txt","w") as file:
    for path, keys_array in tables.items():
        message =''
        if path != 'conn':
            message +=f'INSERT INTO {path} (['
            for i in range (len(tables[path])):
                if (i!= len(tables[path])-1):
                    message += f'{tables[path][i]},\n'
                else:
                    message += f'{tables[path][i]}\n'
            message+= f']);'
        print(path)
        file.write(message)

# conn insertion
with open ("insert-into.txt","w") as file:
    print(len(tables['conn']))
    message =''
    message +=f'INSERT INTO conn(['
    for i in range(len(tables['conn'])):
        if i < 40000:
            message += f'{tables['conn'][i]},\n'
            print(i)
    message+= f']);'
    file.write(message)

with open ("insert-into2.txt","w") as file:
    message =''
    message +=f'INSERT INTO conn(['
    for i in range(40000,len(tables['conn'])):
        if i < 80000:
            message += f'{tables['conn'][i]},\n'
            print(i)
    message+= f']);'
    file.write(message)

with open ("insert-into3.txt","w") as file:
    message =''
    message +=f'INSERT INTO conn(['
    for i in range(80000,len(tables['conn'])):
        message += f'{tables['conn'][i]},\n'
        print(i)
    message+= f']);'
    file.write(message)
