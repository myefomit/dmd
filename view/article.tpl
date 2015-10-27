<!DOCTYPE html>
<html>
<head>
  <title>{{article['title']}}</title>
</head>
<body>
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
    <p>{{article['summary']}}</p>
  </div>
  <div>
    <span>{{article['link']}}</span>
  </div>

</body>
</html>