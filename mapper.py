import psycopg2

class Article:

  """Article class represents Article entity and maps each method to some SQL"""

  conn = psycopg2.connect("dbname=project77 user=postgres")
  cur = conn.cursor()

  @staticmethod
  def find_by_author(author_name, limit=0):
    select = "SELECT DISTINCT ON (title) title, summary, name, link FROM "
    tables = "authors, articles, connection WHERE "
    where = "authors.aid = connection.aid and connection.id = articles.id and "
    request = select + tables + where
    if limit:
      sql = request + "authors.name ILIKE %(like)s LIMIT %(limit)s"
      Article.cur.execute(sql, dict(like= '%'+author_name+'%', limit=limit))
    else:
      sql = request + "authors.name ILIKE %(like)s"
      Article.cur.execute(sql, dict(like= '%'+author_name+'%'))
    data = Article.cur.fetchall()
    return data

