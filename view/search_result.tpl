<link rel="stylesheet" href="styles/main.css">
<div class="results">
  %if (rows != []):
    %for row in rows:
      <div><h3>{{row[0]}}</h3></div>
      <div><p>{{row[1]}}</p></div>
    %end
  %else:
    <h1>Nothing for {{name}} today, come back soon!</h1>
  %end
</div>
<a href="/">Take me back</a>
