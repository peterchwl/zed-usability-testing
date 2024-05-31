import sqlite3
import os

# Example usage
database_file = "./database/data-heterogeneous.db"  # Replace with your database file path
conn = sqlite3.connect(database_file)
cursor = conn.cursor()

# Check if the view exists
cursor.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name='new_table';")
existing_view = cursor.fetchone()


if existing_view:
    # View exists, so drop it
    #cursor.execute("DROP VIEW newViewDB;")
    print("Table exists. If you want to delete it, uncomment out the 2 lines of code below. Making a new one will take time and re-running this.")
    cursor.execute("DROP TABLE newViewDB;")
    conn.commit()
else:
    #only if it does not exist does it create a new table
    print("Table does not exist.")
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
    executionCommand=""
    #executionCommand+="CREATE VIEW newViewDB AS SELECT "
    executionCommand+="CREATE TABLE new_table AS SELECT "
    #COALESCE(http.version, NULL) AS version,
    for key, value in dictionaryOfColOccurences.items():
        #print("Key:", key, "- Value:", value)
        executionCommand+="COALESCE("
        for currvalue in value:
            executionCommand+=currvalue+"."+key+", "
        #after you have looped through all values, insert NULL and close it off til the next one
        executionCommand+="NULL) AS "+key+","
        executionCommand+="\n"
    executionCommand = executionCommand[:-2]
    #FROM log FULL OUTER JOIN http on 1=0 FULL OUTER JOIN conn on 1=0
    executionCommand+=f"\nFROM {table_names[0]}"
    table_names.pop(0)
    for table in table_names:
        executionCommand+=f" FULL OUTER JOIN {table} on 1=0"

    print(executionCommand)
    #print(executionCommand)
    cursor.execute(executionCommand)
    print("Done with newView")


    #Commit the transaction and close the connection
    conn.commit()

#now do querying 
#print(conn.execute("SELECT COUNT(*) FROM new_table;").fetchall())
    
#SQ1 - works (tried on ts that exists and the actual ts which does not exist)
#print(conn.execute("SELECT * FROM new_table WHERE ts = '2018-03-24T17:15:21.196410Z';").fetchall())
    

#SQ2 - works but not how we would actually do it
#print(conn.execute("SELECT COUNT(*) FROM new_table WHERE _path = 'http';").fetchall())
    

#SQ3 - does not work. need 700 rows, it returns 586. likely because i can query the string '10.47.5.155' but not the integer/decimal/float 10.47.5.155
cursor.execute("PRAGMA table_info(new_table)")
columns = [row[1] for row in cursor.fetchall()]
# Construct the WHERE clause dynamically
where_conditions = " OR ".join(
    f"[{column}] LIKE '%10.47.5.155%'" for column in columns
)
# Construct the final SQL query
sql_query = f"SELECT COUNT(*) FROM new_table WHERE {where_conditions}"
print(sql_query)
# Execute the query
print(cursor.execute(sql_query).fetchall())


#AQ1- works, just remove COUNT(__) around DISTINCT _path to get actual query
#print(conn.execute("SELECT COUNT(DISTINCT _path) FROM new_table;").fetchall())


#AQ2 - at first glance, works but still need to check each value
#print(conn.execute("SELECT _path, COUNT(*) AS occurrences FROM new_table GROUP BY _path;").fetchall())


#AQ3
#print(conn.execute("SELECT AVG(response_body_len) AS average_response_body_len FROM new_table;").fetchall())
    

#close connection
conn.close()

executionCommand="CREATE TEMP TABLE CountResults (Table_Name TEXT, Row_Count INTEGER);\n"
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
table_names = cursor.fetchall()
table_names = [name[0] for name in table_names]
table_names.remove("new_table")
for table in table_names:
    executionCommand+="INSERT INTO CountResults (Table_Name, Row_Count)\n"
    executionCommand+=f"SELECT '{table}', COUNT() AS Row_Count FROM {table};\n"
# Execute the commands
print(executionCommand)
cursor.executescript(executionCommand)
# Print the results
print(conn.execute("SELECT FROM CountResults;").fetchall())
# Drop the temporary table and commit the transaction
cursor.execute("DROP TABLE CountResults;")
conn.commit()