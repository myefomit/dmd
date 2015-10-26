from bottle import route, run, template, request, static_file
from mapper import Article

# TODO
# 1.search
# 2.categories

@route('/') 
def index():
  return template("view/main.tpl")

@route('/styles/<file>', name='view/styles')
def static(file):
  return static_file(file, root='view/styles')

@route('/search')
def search():
  name = request.query['name']
  limit = request.query['limit']
  data = Article.find_by_author(author_name=name,limit=limit)
  return template("view/search_result.tpl", rows=data, name=name)

run(host='localhost', port=3001)

