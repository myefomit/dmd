from bottle import route, run, template, request, static_file
from mapper import Article

@route('/') 
def index():
  return template("view/main.tpl")

@route('/styles/<file>', name='view/styles')
def static(file):
  return static_file(file, root='view/styles')

@route('/styles/fonts/<file>', name='view/styles/fonts')
def static(file):
  return static_file(file, root='view/styles/fonts')

@route('/search')
def search():
  author_name = request.query['name']
  limit = request.query['limit']
  category = request.query['category']
  title = request.query['title']
  year = request.query['year']

  data = Article.find(author_name, category, title, year, limit)

  return template("view/search_result.tpl", rows=data)

@route('/article/<id>')
def show(id):
  article = Article.find_by_id(id)
  return template("view/article.tpl", article=article)

run(host='localhost', port=3001)

