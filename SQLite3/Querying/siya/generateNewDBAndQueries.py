import sqlite3
import os

while True:
    user_input = input("Do you want homogeneous or heterogeneous? ").strip().lower()
    if user_input == "homogeneous" or user_input == "heterogeneous":
        print("You chose ", user_input)
        break
    else:
        print("Invalid input. Please enter 'homogeneous' or 'heterogeneous'.")
# Example usage
database_file = "../../Ingesting/siya/actualcode/"+ user_input+"_ingesting.db"  # Replace with your database file path
conn = sqlite3.connect(database_file)
cursor = conn.cursor()

# Check if the view exists
cursor.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name='new_table';")
existing_view = cursor.fetchone()



###
### DO QUERY BUT ONLY EXECUTE IF TABLE DOES NOT EXIST
###
# Query to get all table names
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
# Fetch all table names
table_names = cursor.fetchall()
dictionaryOfColOccurences={}
# Extract table names and column names from the result
#Key is column name and value is the table names where it appears
table_names = [name[0] for name in table_names]
for table in table_names:
    #print()
    #print(table)
    cursor.execute(f"PRAGMA table_info({table});")
    columns = cursor.fetchall()
    for column in columns:
        colname=column[1]
        colname=f"[{colname}]" #escape periods
        #print(colname)
        if colname in dictionaryOfColOccurences:
            #print(colname, " exists in the dictionary with ", table)
            dictionaryOfColOccurences[colname].append(table)
            #print(". Total is ",dictionaryOfColOccurences[colname] )
            #print(dictionaryOfColOccurences[colname])
        else:
            #print(colname, " newly added with ", table)
            dictionaryOfColOccurences[colname]=[table]
            #print(dictionaryOfColOccurences[colname])
print(dictionaryOfColOccurences)
numofoperators=0
numofoperands=0
numoffilesources=0
executionCommand=""
#executionCommand+="CREATE VIEW newViewDB AS SELECT "
executionCommand+="CREATE TABLE new_table AS SELECT "
numofoperators+=3
numofoperands+=1
#COALESCE(http.version, NULL) AS version,
for key, value in dictionaryOfColOccurences.items():
    #print("Key:", key, "- Value:", value)
    executionCommand+="COALESCE("
    numofoperators+=1
    for currvalue in value:
        executionCommand+=currvalue+"."+key+", "
        numoffilesources+=1
        numofoperands+=1
    #after you have looped through all values, insert NULL and close it off til the next one
    executionCommand+="NULL) AS "+key+","
    numofoperators+=1
    numofoperands+=2
    executionCommand+="\n"
executionCommand = executionCommand[:-2]
#FROM log FULL OUTER JOIN http on 1=0 FULL OUTER JOIN conn on 1=0
executionCommand+=f"\nFROM {table_names[0]}"
table_names.pop(0)
numofoperators+=1
numoffilesources+=1
for table in table_names:
    executionCommand+=f" FULL OUTER JOIN {table} on 1=0"
    numofoperators+=3
    numoffilesources+=1
    numofoperands+=2
print(executionCommand)
print("number of operators "+ str(numofoperators))
print("number of operands "+ str(numofoperands))
print("number of file sources "+ str(numoffilesources))
###
## CHECK IF WE ARE GOING TO EXECUTE QUERY
###

if existing_view:
    # View exists, so drop it
    #cursor.execute("DROP VIEW newViewDB;")
    print("Table exists. If you want to delete it, uncomment out the 2 lines of code below and rerun it. Making a new one will take time (30 mins MINIMUM)")
    #cursor.execute("DROP TABLE newViewDB;")
    #conn.commit()
else:
    #only if it does not exist does it create a new table
    print("Table does not exist.")
    cursor.execute(executionCommand)
    print("Done with newView")


    #Commit the transaction and close the connection
    conn.commit()

#now do querying 
#print(conn.execute("SELECT COUNT(*) FROM new_table;").fetchall())
    
#SQ1 - works (tried on ts that exists and the actual ts which does not exist)
with open("query_results/" + user_input+ "_results/search1.txt", "w") as file:
    result = conn.execute("SELECT * FROM new_table WHERE ts = '2018-03-24T17:15:21.196410Z';").fetchall()
    print(result, file=file) 

#SQ2
with open("query_results/" + user_input+ "_results/search2.txt", "w") as file:
    if user_input=="heterogeneous":
        result = conn.execute("SELECT * FROM 'http';").fetchall()
        print(result, file=file) 
    else:
        result = conn.execute("SELECT * FROM http;").fetchall()
        print(result, file=file)
    

#SQ3 
cursor.execute("PRAGMA table_info(new_table)")
columns = [row[1] for row in cursor.fetchall()]
print("number of cols is " + str(len(columns)))
# Construct the WHERE clause dynamically
where_conditions = " OR ".join(
    f"[{column}] LIKE '%10.47.5.155%'" for column in columns
)
# Construct the final SQL query
sql_query = f"SELECT * FROM new_table WHERE {where_conditions}"
#print(sql_query)
# Execute the query
with open("query_results/" + user_input+ "_results/search3.txt", "w") as file:
    result = cursor.execute(sql_query).fetchall()
    print(result, file=file) 

#AQ1
with open("query_results/" + user_input+ "_results/analytical1.txt", "w") as file:
    result = conn.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name!='new_table' AND name!='resp_body_len_table';").fetchall()
    print(result, file=file)


#AQ2 
executionCommand=""
numofoperators=0
numoffilesources=0
numofoperands=0
executionCommand="CREATE TEMP TABLE CountResults (Table_Name TEXT, Row_Count INTEGER);\n"
numofoperators+=1+2
numofoperands+=1+2
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
table_names = cursor.fetchall()
table_names = [name[0] for name in table_names]
if ("new_table" in table_names):
    table_names.remove("new_table")
if ("resp_body_len_table" in table_names):
    table_names.remove("resp_body_len_table")
for table in table_names:
    executionCommand+="INSERT INTO CountResults (Table_Name, Row_Count)\n"
    numofoperators+=1
    numofoperands+=2
    numoffilesources+=1
    executionCommand+=f"SELECT '{table}', COUNT(*) AS Row_Count FROM {table};\n" 
    numofoperators+=4 # SELECT, COUNT, AS, FROM
    numofoperands+=2 # *, Row_Count
    numoffilesources+=2 # {table}, {table}
# Execute the commands
#print(executionCommand)
cursor.executescript(executionCommand)
# Print the results
with open("query_results/" + user_input+ "_results/analytical2.txt", "w") as file:
    result = conn.execute("SELECT * FROM CountResults;").fetchall()
    print(result, file=file)
numofoperators+=2 #select, FROM
numofoperands+=1 # * 
numoffilesources+=1 # CountResults
print("Num of operators is ", numofoperands)
print("Num of operands is ", numofoperands)
print("Num of file sources is ", numoffilesources)
# Drop the temporary table and commit the transaction
cursor.execute("DROP TABLE CountResults;")
conn.commit()



# AQ3- creating new table and querying from there
cursor.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name='resp_body_len_table';")
existing_resp_table = cursor.fetchone()
executionCommand=""
if existing_resp_table:
    print("response_body_len table does exist. Uncomment lines to delete it")
    #cursor.execute("DROP TABLE resp_body_len_table;")
    #conn.commit()
    #print("response_body_len table now deleted")
else:
    print("response_body_len table DOES NOT exist")
    executionCommand+="CREATE TABLE resp_body_len_table AS SELECT "
    key="[response_body_len]"
    values=dictionaryOfColOccurences[key]
    executionCommand+="COALESCE("
    print(values)
    for value in values:
        if value!='new_table':
            executionCommand+=value+"."+key+", "
    executionCommand+="NULL) AS "+key
    executionCommand+=f"\nFROM {values[0]}"
    values.pop(0)
    print(values)
    for value in values:
        if value !='new_table':
            executionCommand+=f" FULL OUTER JOIN {value} on 1=0"
    print(executionCommand)
    cursor.execute(executionCommand)
    conn.commit()
#actual AQ3
with open("query_results/" + user_input+ "_results/analytical3.txt", "w") as file:
    result = conn.execute("SELECT AVG([response_body_len]) AS average_value FROM resp_body_len_table;").fetchall()
    print(result, file=file)
#print(conn.execute("SELECT AVG([response_body_len]) AS average_value FROM resp_body_len_table;").fetchall())
#close connection
conn.close()



