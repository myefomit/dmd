import urllib.request
import time
from xml.dom.minidom import parse 

f = open('file.txt', 'w')
data = urllib.request.urlopen('http://export.arxiv.org/oai2?verb=ListRecords&metadataPrefix=arXiv').read()
f.write(str(data).replace('b\'','', 1).replace('\\n', '').replace('OAI-PMH>\'','OAI-PMH>'))
document = parse('file.txt')
tokenTag = document.getElementsByTagName('resumptionToken')[0].toxml()
token = tokenTag.replace('<resumptionToken>','').replace('|1001</resumptionToken>','')
token = token[55:]
print(token)
time.sleep(20)

for i in range (200, 1400):
    f = open('file' + str(i) + '.txt', 'w')
    print(i)
    data = urllib.request.urlopen('http://export.arxiv.org/oai2?verb=ListRecords&resumptionToken=' + str(token) + '|' + str(i) + '001').read()
    f.write(str(data).replace('b\'','', 1).replace('\\n', '').replace('OAI-PMH>\'','OAI-PMH>'))
    time.sleep(20) 
f.close()
