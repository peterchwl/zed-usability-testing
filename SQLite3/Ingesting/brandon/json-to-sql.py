import json
import sqlite3
from collections import defaultdict

'''paths = ["conn", "dce_rpc", "dns", "dpd", "files", "ftp", "http", "kerberos", "modbus", "notice", "ntlm", "ntp",
         "pe", "rdp", "smb_files", "smb_mapping", "smtp", "snmp", "ssh", "ssl", "syslog", "weird", "x509"]'''

paths = ["http"]


# conn = sqlite3.connect('mydatabase.db')
conn = sqlite3.connect('homog.db')
cursor = conn.cursor()
# file_path = "heterogeneous.ndjson"
file_path = "homogeneous.ndjson"

# Create a default-dict with default value as an empty list
tables = defaultdict(list)
tables2 = defaultdict(list)

# Populate the dictionary with paths as keys and empty arrays as values
for path in paths:
    tables[path]


def key_sqltype(key, data):
    if type(data[key]).__name__ == "int":
        sql_type = "INTEGER"
    elif type(data[key]).__name__ == "float":
        sql_type = "REAL"
    elif type(data[key]).__name__ == "str":
        sql_type = "TEXT"
    elif type(data[key]).__name__ == "list":
        sql_type = "TEXT"
    elif type(data[key]).__name__ == "bool":
        sql_type = "INTEGER"
    else:
        sql_type = "ERROR"
        '''if data[key] == 'True':
            sql_type = 1
        else:
            sql_type = 0'''
    # return "key" + " " + sql_type
    return f'\"{key}\" {sql_type}'


with open(file_path, "r") as json_file:
    for line in json_file:
        # Parse the JSON data from each line into a dictionary
        data = json.loads(line)
        # Now you can work with the data dictionary for each line
        # For example, you can access a specific key like '_path'
        path = data['_path']

        for key in data:
            if key not in tables2[path]:
                key_type = key_sqltype(key, data)
                tables[path].append(key_type)
                tables2[path].append(key)
'''
for key, value in tables2.items():
    for i in range(len(value)):
        value[i] = f'\"{value[i]}\"'
    tables2[key] = value
'''

for path, keys_array in tables.items():
    # Create a table for each path
    columns = ','.join(keys_array)
    # print(columns)
    create_table_query = f"CREATE TABLE IF NOT EXISTS {path} ({columns})"
    # print(path, columns)
    cursor.execute(create_table_query)

# print(tables)
with open(file_path, "r") as json_file:
    for line in json_file:
        data = json.loads(line)
        path = data['_path']
        data_vals = list(data.values())
        data_keys = list(data.keys())

        for i in range(len(data_keys)):
            data_keys[i] = f'\"{data_keys[i]}\"'
        data_keys = ','.join(data_keys)
        # keys = ','.join(tables2[path])
        #print(data_keys)
        placeholders = ','.join(['?'] * len(data_vals))
        insert_into_table = f"INSERT INTO {path} ({data_keys}) VALUES ({placeholders})"
        data_vals = [json.dumps(x) if isinstance(x, list) else x for x in data_vals]
        #print(data_vals)
        #print(insert_into_table)
        cursor.execute(insert_into_table, data_vals)
        conn.commit()

conn.close()
