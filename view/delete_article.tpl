<!-- <!DOCTYPE html>
<html>
<head>
  <title>Delete Article</title>
</head>
<body>

  %if messages:
    <div class="msgs">
      %for message in messages:
        <div class="msg">{{message}}</div>
      %end
    </div>
  %end
  
  <form action="/delete_article" method="post">

    <label for="id">Enter ID: </label>
    <input type="text" name="id">

    <input type="submit" value="Delete">

  </form>
</body>
</html> -->
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Delete Article</title>
    <link href="styles/main.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
    
    <form action="/delete_article" method="post">

      <div id="body" align="center">
        
        <div><t2>Delete Article</t2>
          <div align="center" class="padding">
            <input type="text" id="login" name="id" placeholder="Enter Id">
          </div>
        </div>
        
        <div align="center" class="padding">
          <button type="submit" id="submit" class="Submit"><t1>Submit</t1></button>
        </div>
        
      </div>
    </form>
  </body>
</html>