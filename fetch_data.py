import urllib
import feedparser

# base url
base_url = 'http://export.arxiv.org/api/query?';

# serach parametrs
search_query = 'all:пизда' # search for word
start = 0
max_results = 10

query = 'search_query=%s&start=%i&max_results=%i' % (search_query,
                                                     start,
                                                     max_results)

# let's do this shit
feedparser._FeedParserMixin.namespaces['http://a9.com/-/spec/opensearch/1.1/'] = 'opensearch'
feedparser._FeedParserMixin.namespaces['http://arxiv.org/schemas/atom'] = 'arxiv'

# GET request using the base_url and query
response = urllib.urlopen(base_url+query).read()

# parse the response using feedparser
feed = feedparser.parse(response)

# print some information
print('Feed title: %s' % feed.feed.title)
print('Feed last updated: %s' % feed.feed.updated)

# print opensearch metadata
print('totalResults for this query: %s' % feed.feed.opensearch_totalresults)
print('itemsPerPage for this query: %s' % feed.feed.opensearch_itemsperpage)
print('startIndex for this query: %s'   % feed.feed.opensearch_startindex)

# print information for each entry
for entry in feed.entries:
    print('e-print metadata')
    print('arxiv-id: %s' % entry.id.split('/abs/')[-1])
    print('Published: %s' % entry.published)
    print('Title:  %s' % entry.title)
    
    # подчиняем себе <arxiv:affiliation>
    try:
        author_string += ' (%s)' % entry.arxiv_affiliation
    except AttributeError:
        pass
    
    print('Last Author:  %s' % author_string)
    
    # обработать несколько авторов и напечатать их (feedparser 5.0.1)
    try:
        print('Authors:  %s' % ', '.join(author.name for author in entry.authors))
    except AttributeError:
        pass

    # get links to .pdf or abs
    for link in entry.links:
        if link.rel == 'alternate':
            print('abs page link: %s' % link.href)
        elif link.title == 'pdf':
            print('pdf link: %s' % link.href)
    
    # The journal reference, comments and primary_category 
    # sections live under the arxiv namespace
    try:
        journal_ref = entry.arxiv_journal_ref
    except AttributeError:
        journal_ref = 'No journal ref found'
    print('Journal reference: %s' % journal_ref)
    
    try:
        comment = entry.arxiv_comment
    except AttributeError:
        comment = 'No comment found'
    print('Comments: %s' % comment)
    
    # Since the <arxiv:primary_category> element has no data,
    # feedparser does not store anything inside
    # entry.arxiv_primary_category
    print('Primary Category: %s' % entry.tags[0]['term'])
    
    # get all the categories
    all_categories = [t['term'] for t in entry.tags]
    print('All Categories: %s' % (', ').join(all_categories))
    
    # The abstract is in the <summary> element
    print('Abstract: %s' %  entry.summary)
