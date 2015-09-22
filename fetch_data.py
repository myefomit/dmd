from xml.dom.minidom import parse, parseString

document = parse('file.txt')
for i in range (0, 100):
    try:
        publishedTag = document.getElementsByTagName('published')[0].toxml()
        published = publishedTag.replace('<published>','').replace('</published>','')
        print(published)
        summaryTag = document.getElementsByTagName('summary')[0].toxml()
        summary = summaryTag.replace('<summary>','').replace('</summary>','')
        print(summary)
    except:
        continue
