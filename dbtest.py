import psycopg2

conn = psycopg2.connect("dbname=project user=postgres")
cur = conn.cursor()

cur.execute("CREATE TABLE test (first_name varchar(255), last_name varchar(255));")
cur.execute("INSERT INTO test (first_name, last_name) VALUES ('Bugster', 'Petrov');")
cur.execute("INSERT INTO test (first_name, last_name) VALUES ('Kot', 'Ivanov');")
cur.execute("INSERT INTO test (first_name, last_name) VALUES ('Tuzik', 'unknown');")
cur.execute("INSERT INTO test (first_name, last_name) VALUES ('Bugster', 'Fomenko');")
cur.execute("INSERT INTO test (first_name, last_name) VALUES ('Bugster', 'Gribnoy');")

cur.execute("SELECT * FROM test;")
data = cur.fetchall()
print(data);

conn.commit()
cur.close()
conn.close()

