import urllib.request

f = open('file.txt', 'w')
for i in range (0,1000):
    data = urllib.request.urlopen("http://export.arxiv.org/api/query?search_query=all&start=" + str(i * 1000)  + "&max_results=1000").read()
    print(i)
    f.write(str(data))
    f.write("\n\n")
f.close()
