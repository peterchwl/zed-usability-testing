import sqlite3

def search1(database_path, timestamp):
    try:
        # Connect to the SQLite database
        conn = sqlite3.connect(database_path)
        cursor = conn.cursor()

        # Get a list of all tables in the database
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = cursor.fetchall()

        queries = []
        # Iterate over each table and generate the SQL query
        for table in tables:
            table_name = table[0]
            query = f"SELECT ip_address FROM {table_name} WHERE ts = '{timestamp}'"
            queries.append(query)

        # Close the cursor and connection
        cursor.close()
        conn.close()

        return queries
    except sqlite3.Error as e:
        print("SQLite error:", e)
        return []

# Change 'your_database.db' to the path of your SQLite database file
database_path = 'your_database.db'
# Change '2018-03-24T17:15:21.196410Z' to the timestamp you want to search for
timestamp = '2018-03-24T17:15:21.196410Z'

sq1 = search1(database_path, timestamp)
for query in sq1:
    print(query)