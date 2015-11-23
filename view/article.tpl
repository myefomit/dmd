<!-- <!DOCTYPE html>
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
</html> -->
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>{{article['title']}}</title>
    <link href="../styles/main.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>  

    <div class="nothing">
      <t5><a href="/">Take me back</a></t5>
    </div>
    
    <div id="article">
    
      <div>
        <t2>{{article['title']}}</t2>
      </div>
      
      <div>
        <span><t6>{{", ".join(article['authors'])}}</t6></span>
      </div>
      
      <div>
        <span><t5>{{article['link']}}</t5></span>
      </div>
                
      <div>
        <p><t4>{{article['summary']}}...</t4></p>
      </div>

      <div>
        <span><t6>{{", ".join(article['categories'])}}</t6></span>
      </div>
      
      <div class="related-wrapper">

        <t4>Related articles:</t4>

        <div class="related">
          <span class="related-by-author">
          <a href="/search?name={{article['authors'][0]}}&year=&title=&limit=&category=&order-by=&order="><t5>Same author articles</t5></a>
          </span>
          <t5>|</t5>
          <span class="related-by-category">
          <a href="/search?category={{article['categories'][0]}}&year=&title=&limit=&name=&order-by=&order="><t5>Same category articles</t5></a>
          </span>
        </div>

  </div>
      
    </div>
  </body>
</html>