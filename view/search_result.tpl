<!-- <!DOCTYPE html>
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
          <div class="categories">{{row[3]}}</div>
          %if len(row) >= 6:
            <div><span>{{row[5]}}</span></div>
          %end
          <div class="year">
            {{row[4]}}
          </div>
          <div><p>{{row[1]}}...</p></div>
        %end
      </div>

    %else:
      <h1>Nothing for you today, come back soon!</h1>
    %end
  </div>

  <a href="/">Take me back</a>
</body>
</html> -->
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Search results</title>
    <link href="styles/main.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>  
    <table>
      <td class="table">
        
        %if (rows != []):
          <div class="nothing">
            <t5><a href="/">Take me back</a></t5>
          </div>
        %end
        
        <div id="results">
          %if (rows and rows != []):
            %for row in rows:
            <div class="article-result">
              <div>
                <a href="/article{{row[2].split("abs")[-1]}}"><t7>{{row[0]}}</t7></a>
                <div><t5>{{row[2]}}</t5></div>
              </div>

              %if len(row) >= 6:
                <t6><div><span>{{row[5]}}</span></div></t6>
              %end

              <div class="year">
                <t6>{{row[4]}}</t6>
              </div>

              <div><t4>{{row[1]}}...</t4></div>

              <div class="categories"><t6>{{row[3]}}</t6></div>

              </div>

            %end

          %else:
            <t2>Nothing for you today, come back soon!</t2>
          %end

        </div>
        
        <div class="nothing">
          <t5><a href="/">Take me back</a></t5>
        </div>

      </td>
    </table>
  </body>
</html>