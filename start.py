from bottle import route, run, template, request, static_file, get, post, response
from mapper import Article
from user import User

@route('/') 
def index():
  user = request.get_cookie('account', secret='SECRETKEY')
  return template("view/main.tpl", messages=False, user=user)

@route('/styles/<file>', name='view/styles')
def static(file):
  return static_file(file, root='view/styles')

@route('/search')
def search():
  author = request.query['name']
  limit = request.query['limit']
  category = request.query['category']
  title = request.query['title']
  year = request.query['year']
  order_by = request.query['order-by']
  order = request.query['order']
  data = Article.find(author, category, title, year, limit, order_by, order)
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
  if not logged_user:
    return template("view/sign_in.tpl", messages=False)
  else:
    return template("view/main.tpl", messages=User.ALREADY_SIGNED_IN, user=logged_user)

@get('/sign_out')
def sign_out():
  response.set_cookie('account', '', secret='SECRETKEY')
  return template("view/main.tpl", messages=False, user=False)

@route('/article/<id>/<post>')
def show(id, post):
  id = id + "/" + post
  article = Article.find_by_id(id)
  return template("view/article.tpl", article=article)

@route('/article/<id>')
def show(id):
  article = Article.find_by_id(id)
  return template("view/article.tpl", article=article)

@get('/new_article')
def show_new_article():
  logged_user = request.get_cookie('account', secret='SECRETKEY')
  if not logged_user:
    return template("view/main.tpl", messages=User.permission_msgs['writer'], user=False)
  else:
    return template("view/new_article.tpl", messages=False, user=logged_user)  

@post('/new_article')
def new_article():
  logged_user = request.get_cookie('account', secret='SECRETKEY')
  author = request.forms.get('author')
  category = request.forms.get('category')
  summary = request.forms.get('summary')
  title = request.forms.get('title')
  year = request.forms.get('year')
  id = request.forms.get('id')

  if Article.create(author, category, title, year, summary, id):
    return template("view/main.tpl", messages=Article.SCCS_MSGS, user=logged_user)
  else:
    return template("view/new_article.tpl", messages=Article.ERROR_MSGS, user=logged_user)

@get('/delete_article')
def show_delete_article():
  logged_user = request.get_cookie('account', secret='SECRETKEY')
  if User.is_admin(logged_user):
    return template("view/delete_article.tpl", messages=False)
  else:
    return template("view/main.tpl", messages=User.permission_msgs['admin'], user=logged_user)

@post('/delete_article')
def delete_article():
  logged_user = request.get_cookie('account', secret='SECRETKEY')
  id = request.forms.get('id')
  if Article.delete(id):
    return template("view/main.tpl", messages=Article.SCCS_MSGS, user=logged_user)
  else:
    return template("view/delete_article.tpl", messages=Article.ERROR_MSGS, user=logged_user)

@get('/update_article')
def show_update_article():
  logged_user = request.get_cookie('account', secret='SECRETKEY')
  if User.is_admin(logged_user):
    return template("view/update_article", messages=False)
  else:
    return template("view/main.tpl", messages=User.permission_msgs['admin'], user=logged_user)

@post('/update_article')    
def update_article():
  logged_user = request.get_cookie('account', secret='SECRETKEY')
  author = request.forms.get('author')
  category = request.forms.get('category')
  summary = request.forms.get('summary')
  title = request.forms.get('title')
  year = request.forms.get('year')
  id = request.forms.get('id')

  if Article.update(author, category, summary, title, year, id):
    return template("view/main.tpl", messages=Article.SCCS_MSGS, user=logged_user)
  else:
    return template("view/update_article.tpl", messages=Article.ERROR_MSGS, user=logged_user)


run(host='localhost', port=3001)
