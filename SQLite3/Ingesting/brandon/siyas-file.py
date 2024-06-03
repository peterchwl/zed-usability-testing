import sqlite3
import os

# Example usage
database_file = "heterog.db"  # Replace with your database file path
conn = sqlite3.connect(database_file)
cursor = conn.cursor()

# Check if the view exists
cursor.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name='new_table';")
existing_view = cursor.fetchone()


if existing_view:
    # View exists, so drop it
    #cursor.execute("DROP VIEW newViewDB;")
    print("Table exists. If you want to delete it, uncomment out the 2 lines of code below. Making a new one will take time and re-running this.")
    #cursor.execute("DROP TABLE newViewDB;")
    #conn.commit()
else:
    #only if it does not exist does it create a new table
    print("Table does not exist.")
    # Query to get all table names
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';")
    #SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';
    #SELECT name FROM sqlite_master WHERE type='table';

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
            colname=f"\"{colname}\"" #escape periods
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
    executionCommand+=';'
    print(executionCommand)
    #cursor.execute(executionCommand)
    print("Done with newView")


    #Commit the transaction and close the connection
    conn.commit()
