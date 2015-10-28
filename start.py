from bottle import route, run, template, request, static_file, get, post, response
from mapper import Article
from user import User

@route('/') 
def index():
  return template("view/main.tpl", messages=False, user=False)

@route('/styles/<file>', name='view/styles')
def static(file):
  return static_file(file, root='view/styles')

@route('/search')
def search():
  author_name = request.query['name']
  limit = request.query['limit']
  category = request.query['category']
  title = request.query['title']
  year = request.query['year']
  data = Article.find(author_name, category, title, year, limit)
  return template("view/search_result.tpl", rows=data)

@post('/sign_up')
def sign_up():
  username = request.forms.get('username').lower()
  password = request.forms.get('password')
  if User.new(username, password):
    return template("view/main.tpl", messages=User.success_messages, user=False)
  else:
    temp = User.error_messages
    User.error_messages = []
    return template("view/sign_up.tpl", messages=temp)

@get('/sign_up')
def show_sign_up():
  return template("view/sign_up.tpl", messages=False)

@post('/sign_in')
def sign_in():
  username = request.forms.get('username').lower()
  password = request.forms.get('password')
  user = User.check_login(username, password)
  if user:
    response.set_cookie('account', username, secret='SECRETKEY')
    return template("view/main.tpl", messages=False, user=user['username'])
  else:
    return template("view/sign_in.tpl", messages=User.error_messages)

@get('/sign_in')
def show_sign_in():
  logged_user = request.get_cookie('account', secret='SECRETKEY')
  print(logged_user)
  if not logged_user:
    return template("view/sign_in.tpl", messages=False)
  else:
    return template("view/main.tpl", messages=User.ALREADY_SIGNED_IN, user=logged_user)

@get('/sign_out')
def sign_out():
  response.set_cookie('account', '', secret='SECRETKEY')
  return template("view/main.tpl", messages=False, user=False)

@route('/article/<id>')
def show(id):
  article = Article.find_by_id(id)
  return template("view/article.tpl", article=article)

run(host='localhost', port=3001)

