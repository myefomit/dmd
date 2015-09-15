import urllib 
url = 'http://export.arxiv.org/api/query?search_query=all&start=0&max_results=10000' #10 000 is max
data = urllib.urlopen(url).read()
f = open('result.txt', 'w')
f.write(data)
