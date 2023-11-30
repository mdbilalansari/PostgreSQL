
# coding: utf-8
# # Using PostgreSQL in Python (with Psycopg2)
# 
# ### Psycopg2
# 
# A library that allows Python to connect to an existing PostgreSQL database to utilize SQL functionality.
# 
# #### Documentation
#  * http://initd.org/psycopg/docs/install.html
# 

# After installing with pip install psycopg2
import psycopg2 as pg2


# Create a connection with PostgreSQL
conn = pg2.connect(database='dvdrental', user='postgres',password='postgres')

# Establish connection and start cursor to be ready to query
cur = conn.cursor()

# Pass in a PostgreSQL query as a string
cur.execute("SELECT * FROM payment")

# Return a tuple of the first row as Python objects
first_row = cur.fetchone()
print("First entry: ", first_row)

# Return N number of rows
data = cur.fetchmany(10)
print("First 10 entries:")
for row in data:
    print(row)
    
# Return All rows at once
data = cur.fetchall()

# Inserting Information

query1 = '''
        CREATE TABLE new_table (
            userid integer
            , tmstmp timestamp
            , type varchar(10)
        );
        '''

cur.execute(query1)

# commit the changes to the database
# cur.commit()

# Don't forget to close the connection!
# killing the kernel or shutting down juptyer will also close it
conn.close()

