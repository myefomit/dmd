<link rel="stylesheet" href="styles/main.css">
<a href="/">Take me back</a>
<div class="results">
  %if (rows != []):
    %for row in rows:
      <div><h3>{{row[0]}}</h3> - <span>{{row[2]}}</span></div>
      <div><p>{{row[1]}}...</p></div>
      <div><p><a href="{{row[3]}}">Go to archive!</a></p></div>
    %end
  %else:
    <h1>Nothing for {{name}} today, come back soon!</h1>
  %end
</div>
<a href="/">Take me back</a>
