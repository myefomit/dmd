from xml.dom.minidom import parse

for i in range (0, 1001):
    try:
        document = parse('file' + str(i) + '.txt')
        f = open('data' + str(i) + '.txt', 'w')
        for k in range(1, 1002):
            idTag = document.getElementsByTagName('id')[k-1].toxml()
            id = idTag.replace('<id>','').replace('</id>','')
            f.write('http://arxiv.org/abs/' + id)
            f.write('\n')
            forenamesTag = document.getElementsByTagName('forenames')[k-1].toxml()
            forenames = forenamesTag.replace('<forenames>','').replace('</forenames>','')
            f.write(forenames + ' ')
            keynameTag = document.getElementsByTagName('keyname')[k-1].toxml()
            keyname = keynameTag.replace('<keyname>','').replace('</keyname>','')
            f.write(keyname)
            f.write('\n')
            categoriesTag = document.getElementsByTagName('categories')[k-1].toxml()
            categories = categoriesTag.replace('<categories>','').replace('</categories>','')
            f.write(categories)
            f.write('\n')
            titleTag = document.getElementsByTagName('title')[k-1].toxml()
            title = titleTag.replace('<title>','').replace('</title>','')
            f.write(title)
            f.write('\n')
            createdTag = document.getElementsByTagName('created')[k-1].toxml()
            created = createdTag.replace('<created>','').replace('</created>','')
            created = created[:4]
            f.write(created)
            f.write('\n')
            abstractTag = document.getElementsByTagName('abstract')[k-1].toxml()
            abstract = abstractTag.replace('<abstract>','').replace('</abstract>','')
            abstract = abstract[:250]
            f.write(abstract + '...')
            f.write('\n')
        f.close()
    except:
        continue
