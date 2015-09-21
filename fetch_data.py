from xml.dom.minidom import parseString
file = open('file.xml', 'w')
data = file.read()
file.close()
dom = parseString(data)
tilteTag = dom.getElementsByTagTitle('title')[0].toxml()
tilte=tilteTag.replace('<title>','').replace('</title>','')
f. = open('base.xml', 'w')
f.write(data)
