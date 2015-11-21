import psycopg2

class Article:

  """This class decides which type of search it would be based on provided params"""

  conn = psycopg2.connect("dbname=projnew user=postgres")
  cur = conn.cursor()
  ERROR_MSGS = []
  SCCS_MSGS = []

  @staticmethod
  def find(author, category, title, year, limit):

    Article.clean_msgs()

    BASE_SQL = "SELECT DISTINCT ON(title) title, summary, link, category "
    conditions = "WHERE articles.id = article_categories.id and articles.id = article_categories.id and article_categories.cid = categories.cid "

    if not (title or year or author or category):
      return -1

    if author:
      BASE_SQL = BASE_SQL + ", name FROM articles, categories, authors, article_authors, article_categories "
      conditions = conditions + "and articles.id = article_authors.id and article_authors.aid = authors.aid and authors.name ILIKE " + repr("%%"+author+"%%") + " "
    else:
      BASE_SQL = BASE_SQL + "FROM articles, article_categories, categories "

    if title:
      conditions = conditions + "and lexemes @@ plainto_tsquery(%(title)s) "
    if year:
      conditions = conditions + "and year = %(year)s "
    if category:
      conditions = conditions + "and categories.category = %(category)s"

    if limit:
      conditions = conditions + "LIMIT (%(limit)s)"
    else:
      conditions = conditions + "LIMIT 50"

    Article.cur.execute(BASE_SQL + conditions, dict(title=title, category=category, year=year, limit=limit))
    data = Article.cur.fetchall()

    return data

  @staticmethod
  def find_by_id(id):

    Article.clean_msgs()

    authors = []
    categories = []

    Article.cur.execute("SELECT DISTINCT ON (title) title, summary, link FROM articles WHERE id = %s", (id, ))
    data = Article.cur.fetchall()
    Article.cur.execute("SELECT DISTINCT name FROM article_authors as aa, authors as au, articles as ar  WHERE au.aid = aa.aid and ar.id = aa.id and ar.id = %s", (id, ))
    authors_data = Article.cur.fetchall()
    Article.cur.execute("SELECT DISTINCT category FROM categories as ca, articles as ar, article_categories as ac WHERE ca.cid = ac.cid and ar.id = ac.id and ar.id = %s", (id, ))
    categories_data = Article.cur.fetchall()

    for i in range(0, len(authors_data)):
      authors.append(authors_data[i][0])

    for x in range(0, len(categories_data)):
      categories.append(categories_data[x][0])

    return dict(title=data[0][0], summary=data[0][1], link=data[0][2], authors=authors, categories=categories)

  @staticmethod
  def create(author, category, title, year, summary, id):

    Article.clean_msgs()

    MAX_LENGTH = 250
    MAX_ID_LENGTH = 19

    if not (author and year and category and title and summary and id):
      return False

    if len(title) > MAX_LENGTH:
      title = title[:MAX_LENGTH] + "..."

    if len(summary) > MAX_LENGTH:
      summary = summary[:MAX_LENGTH] + "..."

    if len(id) > MAX_ID_LENGTH:
      id = id[:MAX_ID_LENGTH]

    if len(author) > MAX_LENGTH:
      author = author[:MAX_LENGTH] + "..."


    try:
      Article.cur.execute("INSERT INTO authors(name) VALUES (%s)", (author,))
    except:
      pass
    Article.conn.commit()
    Article.cur.execute("SELECT aid FROM authors WHERE name = %s", (author,))

    aid = Article.cur.fetchall()[0]
    link = "http://arxiv.org/abs/" + id

    try:
      Article.cur.execute("INSERT INTO articles(title, summary, id, year, link) VALUES (%s, %s, %s, %s, %s)", (title, summary, id, year, link,))
    except:
      Article.ERROR_MSGS.append("Article id must be unique")

    Article.conn.commit()

    Article.cur.execute("INSERT INTO article_authors(id, aid) VALUES (%s, %s)", (id, aid,))
    Article.cur.execute("SELECT cid FROM categories WHERE category = %s", (category,))

    cid = Article.cur.fetchall()[0]

    Article.cur.execute("INSERT INTO article_categories(id, cid) VALUES (%s, %s)", (id, cid,))
    Article.conn.commit()

    if len(Article.ERROR_MSGS) != 0:
      return False

    Article.SCCS_MSGS.append("You've successfully added a new article")

    return True

  @staticmethod
  def delete(id):

    Article.clean_msgs()

    if not id:
      return False

    Article.cur.execute("SELECT id FROM articles WHERE id = %s", (id,))

    id_exists = Article.cur.fetchall()

    if len(id_exists) == 0:
      Article.ERROR_MSGS.append("There is no article with such ID.")
      return False

    Article.cur.execute("DELETE FROM articles WHERE id = %s", (id,))
    Article.cur.execute("DELETE FROM article_categories WHERE id = %s", (id,))
    Article.cur.execute("DELETE FROM article_authors WHERE id = %s", (id,))

    Article.conn.commit()

    Article.SCCS_MSGS.append("Yay! Article was deleted!")

    return True

  @staticmethod
  def update(author, category, summary, title, year, id):

    Article.clean_msgs()

    if not (author and year and category and title and summary and id):
      Article.ERROR_MSGS.append("All fields are required")
      return False

    if Article.delete(id):
      if Article.create(author, category, summary, title, year, id):
        Article.SCCS_MSGS.append("You've successfully updated the article")
        return True
      else:
        Article.ERROR_MSGS.append("Woops! Something went wrong and article was removed :(")
        return False
    else:
      Article.ERROR_MSGS.append("Update failed :(")
      return False

  @staticmethod
  def clean_msgs():
    Article.ERROR_MSGS = []
    Article.SCCS_MSGS = []




