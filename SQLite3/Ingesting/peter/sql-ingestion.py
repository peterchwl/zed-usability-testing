import sqlite3
import json
from collections import defaultdict
import sys

records = []

file = input("File: ")

if file != "homogeneous" and file != "heterogeneous" and file != "homogeneous_half" and file != "heterogeneous_half":
    print("Please enter a valid file")
    sys.exit()


def delete_all_tables(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
    tables = cursor.fetchall()
    for table in tables:
        try:
            cursor.execute(f'DROP TABLE IF EXISTS "{table[0]}"')
            print(f"Table '{table[0]}' deleted successfully.")
        except sqlite3.Error as e:
            print(f"Error deleting table '{table[0]}': {e}")
            
            
def ingest_data(conn, file_path):
    # get pointer to sql
    cursor = conn.cursor()
    
    # delete old tables
    delete_all_tables(conn)
    
    # extract paths and keys
    attributes = extract_attributes(file_path)
    # create tables accordingly with path as table and keys as attributes
    create_tables(conn, cursor, attributes)
    
    with open(file_path, 'r') as file:
        for line in file:
            # current record
            record = json.loads(line.strip())
            # writing the query with python fstring
            table = record['_path']
            columns = ', '.join([f'"{i}"' for i in record.keys()])
            variables = ', '.join(['?' for _ in record])
            values = tuple(record.get(key, None) for key in record.keys())
            # execute query
            temp_query = f'INSERT INTO {table} ({columns}) VALUES ({variables})'

            values = tuple([str(i) if type(i) == list else i for i in values])
            cursor.execute(temp_query, values)

            # store values in external list
            records.append(record)

    # # print tables
    # cursor.execute(f"SELECT name FROM sqlite_master WHERE type='table'")
    # tables = cursor.fetchall()
    # for table in tables:
    #     print(f"{table}")
    
    conn.commit()
    conn.close()

def create_tables(conn, cursor, attributes):
    for path in attributes.keys():
        columns = ''
        for key, val in attributes[path]:
            curr_key = f'"{key}" '
            if val == int:
                curr_key += 'INT'
            elif val == str:
                curr_key += 'TEXT'
            elif val == list:
                curr_key += 'TEXT'
            columns += f'{curr_key}, '
            
        columns = columns[:-2]
        # print(f'CREATE TABLE IF NOT EXISTS {path} ({columns})')
        cursor.execute(f'CREATE TABLE IF NOT EXISTS {path} ({columns})')
        conn.commit()
        print(f"Table '{path}' created succesfully.")
        
def extract_attributes(file_path):
    # initialize dictionary of key path value all keys[]
    attributes = defaultdict(list)
    # parse file
    with open(file_path, 'r') as file:
        for line in file:
            # for each record
            record = json.loads(line.strip())
            # # union curr keys with new keys (excluding _path) for each _path
            # attributes[record['_path']] = list(set(attributes[record['_path']] + [(x, type(record[x])) for x in record.keys() if x != '_path']))
            
            # union curr keys with new keys (including _path) for each _path
            attributes[record['_path']] = list(set(attributes[record['_path']] + [(x, type(record[x])) for x in record.keys()]))
    return attributes

# connect w sql
conn = sqlite3.connect(f'./database/data-{file}.db')
# Example usage
ingest_data(conn, f'../json/database/test-{file}.ndjson')