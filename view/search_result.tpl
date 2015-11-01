<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="styles/main.css">
  <title>Search results</title>
</head>
<body>

  %if (rows != [] and len(rows) > 20):
    <a href="/">Take me back</a>
  %end

  <div class="results">
    %if (rows and rows != []):
      <div class="article">

        %for row in rows:
          <div><a href="/article{{row[2].split("abs")[-1]}}"><h3>{{row[0]}}</h3></a> - <span>{{row[2]}}</span></div>
          %if len(row) >= 5 and row[4]:
            <div><span>{{row[4]}}</span></div>
          %end
          <div><p>{{row[1]}}...</p></div>
        %end
      </div>

    %else:
      <h1>Nothing for you today, come back soon!</h1>
    %end
  </div>

  <a href="/">Take me back</a>
</body>
</html>