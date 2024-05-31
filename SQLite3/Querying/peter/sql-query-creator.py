import sqlite3
import sys
import copy

records = []

file = input("File: ")

if file != "homogeneous" and file != "heterogeneous":
    print("Please enter a valid file")
    sys.exit()

# Create table "new_table"
conn = sqlite3.connect(f'./database/data-{file}.db')
cursor = conn.cursor()
cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
table_names = cursor.fetchall()
dictionaryOfColOccurences={}
table_names = [name[0] for name in table_names]

for table in table_names:
    cursor.execute(f"PRAGMA table_info({table});")
    columns = cursor.fetchall()
    for column in columns:
        colname=column[1]
        colname=f"[{colname}]" #escape periods
        if colname in dictionaryOfColOccurences:
            dictionaryOfColOccurences[colname].append(table)
        else:
            dictionaryOfColOccurences[colname]=[table]
executionCommand=""
executionCommand+="CREATE TABLE new_table AS SELECT "
for key, value in dictionaryOfColOccurences.items():
    executionCommand+="COALESCE("
    for currvalue in value:
        executionCommand+=currvalue+"."+key+", "
    #after you have looped through all values, insert NULL and close it off til the next one
    executionCommand+="NULL) AS "+key+","
    executionCommand+="\n"
executionCommand = executionCommand[:-2]
executionCommand+=f"\nFROM {table_names[0]}"
table_names_copy = copy.deepcopy(table_names)
table_names.pop(0)
for table in table_names:
    executionCommand+=f" FULL OUTER JOIN {table} on 1=0"


#query1
query1 = "select * from new_table where ts = '2018-03-24T17:15:21.196410Z';"

#query2
query2 = "select * from http;"

#query3
cols = []
for table in table_names_copy:
    cursor.execute(f"PRAGMA table_info({table})")
    columns = [row[1] for row in cursor.fetchall()]
    cols = cols + columns

# Construct the WHERE clause dynamically
where_conditions = " OR ".join(
    f"[{column}] LIKE '%10.47.5.155%'" for column in cols
)
# Construct the final SQL query
query3 = f"SELECT * FROM new_table WHERE {where_conditions};"

query4 = "select name from sqlite_master where name != 'new_table';"

create_table = "create table ans (count_col INTEGER);"
delete_table = "DROP TABLE IF EXISTS ans;"
insert_statements = ""
for table in table_names_copy:
    if table != "new_table":
        insert_statements += f"INSERT INTO ans (count_col) SELECT COUNT(*) FROM {table};"

query5 = create_table + insert_statements +  "select * from ans;" + delete_table

query6 = "select avg(response_body_len) from new_table;"

with open('queries.sql', 'w') as file:
    pass 

with open('queries.sql', 'w') as file:
    file.write(executionCommand)
    file.write('\n')
    file.write(query1)
    file.write('\n')
    file.write(query2)
    file.write('\n')
    file.write(query3)
    file.write('\n')
    file.write(query4)
    file.write('\n')
    file.write(query5)
    file.write('\n')
    file.write(query6)
    file.write('\n')