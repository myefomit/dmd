from bottle import route, run, template, request, static_file
import psycopg2

# TODO
# 1.search
# 2.categories

conn = psycopg2.connect("dbname=project77 user=postgres")
cur = conn.cursor()

@route('/') 
def index():
  return template("view/main.tpl")

@route('/styles/<file>', name='view/styles')
def static(file):
  print(file)
  return static_file(file, root='view/styles')

@route('/search')
def search():
  query = request.query['name']
  cur.execute("SELECT title, summary FROM articles WHERE lexemes @@ to_tsquery(%s)", (query,))  
  data = cur.fetchall()
  print(data)
  return template("view/search_result.tpl", rows=data, name=query)

run(host='localhost', port=3001)

