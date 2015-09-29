%if (rows != []):
  %for row in rows:
    <ul>
      <li>First Name: {{row[0]}}</li>
      <li>Last Name: {{row[1]}}</li>
    </ul>
  %end
%else:
  <h1>Nothing for you today, come back soon!</h1>
%end
<a href="/">Take me back</a>