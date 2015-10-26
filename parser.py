from xml.dom.minidom import parse
import psycopg2

conn = psycopg2.connect('dbname=p17 user=postgres')
cur = conn.cursor()

for i in range (0, 1080):
    try:
        document = parse('file' + str(i) + '.txt')
        for k in range(1, 1001):
            id_tag = document.getElementsByTagName('id')[k-1].toxml()
            article_id = id_tag.replace('<id>','').replace('</id>','')

            authors_tag = document.getElementsByTagName('authors')[k-1]
            count = authors_tag.getElementsByTagName('forenames').length
            names = []
            authors_ids = []

            for i in range(0, count):
                forenames = authors_tag.getElementsByTagName('forenames')[i].toxml().replace("<forenames>", "").replace("</forenames>", "")
                keyname = authors_tag.getElementsByTagName('keyname')[i].toxml().replace("<keyname>", "").replace("</keyname>", "")
                full_name = forenames.replace("\\", "").replace("\'", "") + " " + keyname.replace("\\", "").replace("\'", "")
                names.append(full_name)

            for name in names:
                try:
                    cur.execute("INSERT INTO authors (name) VALUES (\'" + name + "\');")
                    conn.commit()
                except:
                    print("Uniqueness violation (or smth else) for " + name)
                    conn.commit()
                    continue

                cur.execute("SELECT aid FROM authors WHERE name = \'" + name + "\';")
                data = cur.fetchall()
                if data != []:
                    authors_ids.append(data[0][0])

            categories_tag = document.getElementsByTagName('categories')[k-1].toxml()
            categories = categories_tag.replace('<categories>','').replace('</categories>','')
            categories = categories.split()
            print(categories)
            categories_ids = []

            for category in categories:                
                try:
                    request = "INSERT INTO categories (category) VALUES (\'" + category + "\');"
                    cur.execute(request)
                    conn.commit()
                except:
                    print("Uniqueness violation (or smth else) for " + category)
                    conn.commit()

                cur.execute("SELECT cid FROM categories WHERE category = \'" + category + "\';")
                data = cur.fetchall()
                if data != []:
                    categories_ids.append(data[0][0])

            print("Categories: ")
            print(categories_ids)

            combinations = []
            for author in authors_ids:
                if categories_ids != []:
                  for category in categories_ids:
                      combinations.append([author, category])

            print(combinations)

            title_tag = document.getElementsByTagName('title')[k-1].toxml()
            title = title_tag.replace('<title>','').replace('</title>','')
            created_tag = document.getElementsByTagName('created')[k-1].toxml()
            created = created_tag.replace('<created>','').replace('</created>','')
            created = created[:4]
            abstract_tag = document.getElementsByTagName('abstract')[k-1].toxml()
            abstract = abstract_tag.replace('<abstract>','').replace('</abstract>','')
            abstract = abstract[:250]

            link = "http://arxiv.org/abs/" + article_id
            values = "\'" + article_id + "\',\'" + title + "\',\'" + created + "\',\'" + link + "\',\'" + abstract + "\'"
            print(values)

            try:
                cur.execute("INSERT INTO articles (id, title, year, link, summary) VALUES (" + values + ");" )
            except:
                print("Uniqueness violation (or smth else) for " + article_id)
                conn.commit()
                continue

            for comb in combinations:
                #print("Connection: " + comb[0] + ", " + comb[1])
                request = "INSERT INTO connection (id, aid, cid) VALUES (\'" + article_id + "\',\'" + str(comb[0]) + "\',\'" + str(comb[1]) + "\');"
                print(request)
                # try:
                cur.execute(request)
                conn.commit()
                # except:
                #   print("ERROR!!! REQUEST: " + request)
                #   conn.commit()
                #   continue

            conn.commit()
        f.close()
    except:
        continue
cur.close()
conn.close()
