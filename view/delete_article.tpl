<!DOCTYPE html>
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
</html>