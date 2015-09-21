import urllib.request

f = urllib.request.urlopen('http://export.arxiv.org/api/query?search_query=all&start=0&max_results=1')
myfile = f.read()
f = open('file.xml', 'w')
f.write(str(myfile))
f.close()
