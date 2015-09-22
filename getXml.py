import urllib.request

f = open('file.txt', 'w')
for i in range (0,1000):
    data = urllib.request.urlopen("http://export.arxiv.org/oai2?verb=ListRecords&metadataPrefix=arXiv").read()
    print(i)
    f.write(str(data))
f.close()


