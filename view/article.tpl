<!DOCTYPE html>
<html>
<head>
  <title>{{article['title']}}</title>
</head>
<body>

  <a href="/">Home</a>
  <h1>{{article['title']}}</h1>
  <div class="authors">
    <span>
      {{", ".join(article['authors'])}}
    </span>
  </div>
  <div class="categories">
    <span>
      {{", ".join(article['categories'])}}
    </span>
  </div>
  <div>
    <p>{{article['summary']}}...</p>
  </div>
  <div>
    <span>{{article['link']}}</span>
  </div>

  <div class="related-wrapper">

    <h3>Related articles:</h3>

    <div class="related">
      <span class="related-by-author">
        <a href="/search?name={{article['authors'][0]}}&year=&title=&limit=&category=&order-by=&order=">Same author articles</a>
      </span>
      |
      <span class="related-by-category">
        <a href="/search?category={{article['categories'][0]}}&year=&title=&limit=&name=&order-by=&order=">Same category articles</a>
      </span>
    </div>

  </div>
    
</body>
</html>