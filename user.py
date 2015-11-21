import hashlib
import psycopg2

class User:

  conn = psycopg2.connect("dbname=projnew user=postgres")
  cur = conn.cursor()

  success_messages = []
  error_messages = []
  ALREADY_SIGNED_IN = ["Hey! You're already signed in :)"]
  permission_msgs = {"writer": ["Please, sign in before."], "admin": ["You have not enough permissions, please contact us to get it."]}

  @staticmethod
  def check_login(name, password):
    User.check_presence(name, password)
    hashed = hashlib.sha1(bytes(password, 'utf-8')).hexdigest()

    if User.error_messages == []:
      user = User.find(name, hashed)
      return user
    else:
      return False


  @staticmethod
  def new(name, password):
    if User.check_new_user(name, password):
      hashed = hashlib.sha1(bytes(password, 'utf-8')).hexdigest()
      User.cur.execute("INSERT INTO users (login, password_hash, is_admin) VALUES (%s, %s, false)", (name, hashed,))
      User.conn.commit()
      User.success_messages.append("You have successfully registered at articleHub!")
      return True
    else:
      return False


  @staticmethod
  def check_new_user(name, password):
    User.check_presence(name, password)

    if (len(password) < 6) and (password != ""):
      User.error_messages.append("The password is too short (at least 6 symbols required)!") 

    if len(User.error_messages) != 0:
      return False

    if User.user_exists(name):
      User.error_messages.append("This user already exists! Choose another login.")
      return False
    else:
      return True


  @staticmethod
  def check_presence(name, password):
    if name == "":
      User.error_messages.append("The username is empty!")

    if password == "":
      User.error_messages.append("The password is empty!")


  @staticmethod
  def user_exists(name):
    User.cur.execute("SELECT login FROM users WHERE login = %s", (name,))
    users_already_exists = User.cur.fetchall()

    if len(users_already_exists) == 0:
      return False
    else:
      return True


  @staticmethod
  def find(name, hashed_password):
    User.cur.execute("SELECT login, is_admin FROM users WHERE login = %s and password_hash = %s", (name, hashed_password, ))
    user = User.cur.fetchall()

    if len(user) != 0:
      return dict(username=user[0][0], hashed_password=hashed_password, is_admin=user[0][1])
    else:
      return False
      

  @staticmethod
  def is_admin(username):

    if not username:
      return False

    User.cur.execute("SELECT is_admin FROM users WHERE login = %s", (username,))
    is_admin = User.cur.fetchall()[0][0]

    return is_admin





