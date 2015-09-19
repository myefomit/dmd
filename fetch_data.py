import urllib
import feedparser

# базовый url 
base_url = 'http://export.arxiv.org/api/query?';

# параметры поиска
search_query = 'all:electron' # ищем по слову
start = 0
max_results = 10

query = 'search_query=%s&start=%i&max_results=%i' % (search_query,
                                                     start,
                                                     max_results)

# начнем это
feedparser._FeedParserMixin.namespaces['http://a9.com/-/spec/opensearch/1.1/'] = 'opensearch'
feedparser._FeedParserMixin.namespaces['http://arxiv.org/schemas/atom'] = 'arxiv'

# выполняем запрос get с помощью базового url и запроса
response = urllib.urlopen(base_url+query).read()

#парсим ответ с помощью feedparser
feed = feedparser.parse(response)

# печатаем инфу
print ('Feed title: %s' % feed.feed.title)
print ('Feed last updated: %s' % feed.feed.updated)

# печатаем opensearch metadata
print ('totalResults for this query: %s' % feed.feed.opensearch_totalresults)
print ('itemsPerPage for this query: %s' % feed.feed.opensearch_itemsperpage)
print ('startIndex for this query: %s'   % feed.feed.opensearch_startindex)

# печатаем инфу для каждого вхождения
for entry in feed.entries:
    print ('e-print metadata')
    print ('arxiv-id: %s' % entry.id.split('/abs/')[-1])
    print ('Published: %s' % entry.published)
    print ('Title:  %s' % entry.title)
    
    # feedparser v4.1 получает только первого автора, а не всех
    author_string = entry.author
    
    # подчиняем себе <arxiv:affiliation>
    try:
        author_string += ' (%s)' % entry.arxiv_affiliation
    except AttributeError:
        pass
    
    print ('Last Author:  %s' % author_string)
    
    # обработать несколько авторов и напечатать их (feedparser 5.0.1)
    try:
        print ('Authors:  %s' % ', '.join(author.name for author in entry.authors))
    except AttributeError:
        pass

    # получить ссылки на pdf или abs
    for link in entry.links:
        if link.rel == 'alternate':
            print ('abs page link: %s' % link.href)
        elif link.title == 'pdf':
            print ('pdf link: %s' % link.href)
    
    # под пространством имен АрХив имеются такие разделы, как:
    # journal reference, comments и primary_category
    try:
        journal_ref = entry.arxiv_journal_ref
    except AttributeError:
        journal_ref = 'No journal ref found'
    print ('Journal reference: %s' % journal_ref)
    
    try:
        comment = entry.arxiv_comment
    except AttributeError:
        comment = 'No comment found'
    print ('Comments: %s' % comment)
    
    #  с того момента, как <arxiv:primary_category> не имеет данных -
    # прекратить делать эту хуйню
    print ('Primary Category: %s' % entry.tags[0]['term'])
    
    # получаем все категории 
    all_categories = [t['term'] for t in entry.tags]
    print ('All Categories: %s' % (', ').join(all_categories))
    
    # <suumary>
    print ('Abstract: %s' %  entry.summary)
