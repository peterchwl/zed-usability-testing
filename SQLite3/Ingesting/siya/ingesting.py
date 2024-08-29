import sqlite3
import json
import os

file_path=''
while True:
    user_input = input("Enter 'homogeneous' or 'heterogeneous' to ingest: ")
    if user_input.lower() == 'homogeneous':
        #file_path = '../../../../DataSet/NDJSON_FILES/homogeneous_half.ndjson'
        file_path = '../../../../DataSet/NDJSON_FILES/homogeneous.ndjson'
        print("You chose homogeneous.")
        if os.path.exists("homogeneous_ingesting.db"):
            os.remove("homogeneous_ingesting.db")
            print(f"File homogeneous_ingesting.db deleted successfully.")
        else:
            print(f"File homogeneous_ingesting.db does not exist.")
        conn=sqlite3.connect("homogeneous_ingesting.db")
        break
    elif user_input.lower() == 'heterogeneous':
        #file_path = '../../../../DataSet/NDJSON_FILES/heterogeneous_half.ndjson'
        file_path = '../../../../DataSet/NDJSON_FILES/heterogeneous.ndjson'
        print("You chose heterogeneous.")
        if os.path.exists("heterogeneous_ingesting.db"):
            os.remove("heterogeneous_ingesting.db")
            print(f"File heterogeneous_ingesting.db deleted successfully.")
        else:
            print(f"File heterogeneous_ingesting.db does not exist.")
        conn=sqlite3.connect("heterogeneous_ingesting.db")
        break
    else:
        print("Invalid input. Please enter either 'homogeneous' or 'heterogeneous'.")



#Connect to database
#conn=sqlite3.connect("ingesting.db")
#Create cursor
cur = conn.cursor()

def retrieveTablesData(file_path):
    dictionaryOfInformation={}
    currpath=""
    field_types={}
    with open(file_path, 'r') as file:
        for line in file:
            data = json.loads(line)
            for key, value in data.items():
                if (key == "_path"):
                    currpath=value
                    if currpath not in dictionaryOfInformation:
                        #currpath is NOT already a key in the dictionary
                        dictionaryOfInformation.setdefault(currpath, {})
                    field_types = dictionaryOfInformation[currpath]
                #after you know what the currpath is
                #update value of currpath by updating field_types and saving that as the new value of currpath 
                if currpath!="":
                    if key in field_types and field_types[key] != type(value):
                        print("There are conflicting types for " + key)
                    #else:
                    elif key not in field_types:
                        #if key does not exist, it creates key and updates it with the value. In this case, key is field name and value is 
                        field_types.setdefault(key, type(value))
                    dictionaryOfInformation[currpath]=field_types

    #for key in dictionaryOfInformation:
        #print(key)
        #print("Value:", dictionaryOfInformation[key])
    return dictionaryOfInformation

def createtable(dictionaryOfInformation):
    #loop through field_types to get name of table
    for key in dictionaryOfInformation:
        #print(key)
        tableName=key
        sql = f"CREATE TABLE IF NOT EXISTS {tableName} ("
        field_types=dictionaryOfInformation[tableName]
        print("Field types:")
        for field, field_type in field_types.items():
            #print(f"{field}: {field_type.__name__}")
            if (field_type.__name__ == "int"):
                SQLType = "INTEGER"
            elif (field_type.__name__ == "float"):
                SQLType = "REAL"
            elif (field_type.__name__ == "str"):
                SQLType = "TEXT"
            elif (field_type.__name__ == "list"):
                #print('This is a list')
                SQLType = "TEXT"
            #ensures program does not break
            #else:
                #SQLType = "TEXT"

            #for fields like "id.orig_h" 
            escaped_column_name = f'"{field}"'
            sql += f"{escaped_column_name} {SQLType}, "
        # Remove the last comma and close the statement
        sql = sql[:-2] + ")"
        # Execute the SQL statement
        print(sql)
        cur.execute(sql)
        # Commit changes
        conn.commit()

def ingestDataIntoTable(dictionaryOfInformation, file_path):
    #added a new value called numOfFields in the field_types,so when you loop through ensure that you loop through "-1"
    for key in dictionaryOfInformation:
        #get number of fields and append to end of the dictionary as a new field
        field_types= dictionaryOfInformation[key]
        dictionaryOfInformation[key].setdefault("numOfFields", len(field_types))

    currPath=""
    #alldata_to_insert=[]
    rowOfData_To_Insert=[]
    count=0
    #sql = f"INSERT INTO {table_name} VALUES ({', '.join(['?' for _ in range(len(data_to_insert[0]))])})"
    with open(file_path, 'r') as file:
        for line in file:
            data = json.loads(line)
            sql = f"INSERT INTO "
            #define size of new_row as max number of fields and save each as None
            for currkey, currvalue in data.items():
                #only add if it is of the currpath
                if (currkey == "_path"):
                    currPath=currvalue
                    #print('currPath is ' + currPath)
                    rowOfData_To_Insert=[None]* (dictionaryOfInformation[currPath]["numOfFields"])
                    #print(rowOfData_To_Insert)

                #loop through all fieldnames/types except the last one
                indexOfKey=0
                for fieldname, fieldtype in list(dictionaryOfInformation[currPath].items())[:-1]:
                    #print("Custom key:", fieldname)
                    #print("Custom value:", fieldtype)
                    if (currkey == fieldname):
                        if (type(currvalue).__name__ == "list"):
                            #print("The type is of list")
                            #print(value)
                            thingToInsert=""
                            #thingToInsert=thingToInsert.join(currvalue)
                            thingToInsert=thingToInsert.join(str(currvalue))
                            #print(thingToInsert)
                        else:
                            thingToInsert=currvalue
                        rowOfData_To_Insert[indexOfKey] = thingToInsert
                    indexOfKey+=1
            #insert into table here
            #print(rowOfData_To_Insert)
            placeholders = ', '.join(['?' for _ in rowOfData_To_Insert])
            sql += f" {currPath} VALUES ({placeholders})"
            # Execute the INSERT INTO statement with multiple sets of data
            cur.execute(sql, rowOfData_To_Insert)
            #conn.commit()
            count=count+1
            
            # Commit the transaction to save the changes
            
            #print("Moved onto next line")
            
            if count % 100 == 0:
                conn.commit()
            #break
    conn.commit()
    print("The number of lines is " + str(count))

            
                


dictionaryOfInformation=retrieveTablesData(file_path)
#infoAbtHttp= dictionaryOfInformation["http"]
createtable(dictionaryOfInformation)
ingestDataIntoTable(dictionaryOfInformation, file_path)

#dictionaryOfInformation["http"].setdefault("numOfFields", 12)
#print("info abt http:")
#print(dictionaryOfInformation["http"])

#ensure the right number of tables was created
cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = cur.fetchall()
print()
print("All table names:")
for table in tables:
    print(f"{table}")

#cur.execute(f"SELECT * FROM http")
#count=0
#for person in cur:
    #print(person)
    #count+=1
#print("Number of records queried: " + str(count))






# #First get all paths
# allPaths= getAllPaths(file_path)
# print(allPaths)
# for path in allPaths:
#     #go through each path and get all the different fields and their types
#     field_types = analyze_ndjson_file(file_path, path)
#     #Then create a table for each path
#     createtable(path, field_types)
#     ingestDataIntoTable(file_path, path, field_types)
#     #check proper ingestion
#     print()
#     print("Querying:")
#     cur.execute(f"SELECT * FROM {path}")
#     count=0
#     for person in cur:
#         count+=1
#     print("Number of records queried: " + str(count))


#  # Query the sqlite_master table to get information about tables
cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = cur.fetchall()
# print()


sqlite_select_query = """SELECT * from http"""
cur.execute(sqlite_select_query)
records = cur.fetchall()
print("Total rows are:  ", len(records))



cur.close()
conn.close()