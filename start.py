from bottle import route, run, template, request
import psycopg2

# TODO
# 1.search
# 2.categories

conn = psycopg2.connect("dbname=project user=postgres")
cur = conn.cursor()

@route('/') 
def index():
  return template("view/main.tpl")

@route('/search')
def search():
  name = request.query['name']
  cur.execute("SELECT * FROM test WHERE first_name ILIKE %s", (name,))  
  data = cur.fetchall()
  return template("view/search_result.tpl", rows=data)

run(host='localhost', port=3000)
