<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="styles/main.css">
  <title>Search results</title>
</head>
<body>
  %if (rows != []):
    <a href="/">Take me back</a>
  %end
  <div class="results">
    %if (rows and rows != []):
      %for row in rows:
        <div><a href="/article/{{row[3].split("/")[-1]}}"><h3>{{row[0]}}</h3></a> - <span>{{row[2]}}</span></div>
        <div><p>{{row[1]}}...</p></div>
      %end
    %else:
      <h1>Nothing for you today, come back soon!</h1>
    %end
  </div>
  <a href="/">Take me back</a>
</body>
</html>