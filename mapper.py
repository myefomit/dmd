import psycopg2

class Article:

  """This class decides which type of search it would be based on provided params"""

  conn = psycopg2.connect("dbname=project77 user=postgres")
  cur = conn.cursor()

  @staticmethod
  def find(author_name, category, title, year, limit):

    Article.cur.execute("SELECT DISTINCT ON(title) title, summary, name, link FROM articles as ar, authors as au, connection as co WHERE lexemes @@ to_tsquery(%s) and ar.id = co.id and au.aid = co.aid", (title, ))
    data = Article.cur.fetchall()
    return data

    # if author_name and category and title and year:
    #   select = "SELECT DISTINCT ON (title) title, summary, name, link FROM "
    #   tables = "authors as au, articles as ar, connection as co, categories as ca WHERE "
    #   where_one = "au.aid = co.aid and ar.id = co.id and ca.cid = co.cid and ca.category = %(category)s and "
    #   where_two = "au.name ILIKE %(like)s and lexemes @@ to_tsquery(%(title)s) and ar.year = %(year)s"
    #   sql = select + tables + where_one + where_two
    #   if limit:
    #     sql = sql + " LIMIT " + limit
    #   Article.cur.execute(sql, dict(like='%'+author_name+'%', title=title, category=category, year=year))
    #   data = Article.cur.fetchall()
    #   return data

    #SQLBuilder ->
    

  @staticmethod
  def find_by_id(id):
    authors = []
    categories = []

    Article.cur.execute("SELECT DISTINCT ON (title) title, summary, link FROM articles WHERE id = %s", (id, ))
    data = Article.cur.fetchall()
    Article.cur.execute("SELECT DISTINCT name FROM authors as au, articles as ar, connection as co WHERE au.aid = co.aid and ar.id = co.id and ar.id = %s", (id, ))
    authors_data = Article.cur.fetchall()
    Article.cur.execute("SELECT DISTINCT category FROM categories as ca, articles as ar, connection as co WHERE ca.cid = co.cid and ar.id = co.id and ar.id = %s", (id, ))
    categories_data = Article.cur.fetchall()

    for i in range(0, len(authors_data)):
      authors.append(authors_data[i][0])

    for x in range(0, len(categories_data)):
      categories.append(categories_data[x][0])

    return dict(title=data[0][0], summary=data[0][1], link=data[0][2], authors=authors, categories=categories)



