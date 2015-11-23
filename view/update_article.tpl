<!-- <!DOCTYPE html>
<html>
<head>
  <title>Update Article</title>
</head>
<body>

  <a href="/">Home</a>

  %if messages:
    <div class="msgs">
      %for message in messages:
        <div class="msg">{{message}}</div>
      %end
    </div>
  %end

  <form action="/update_article" method="post">

    <label for="title">Title: </label>
    <input type="text" name="title">

    <label for="summary">Summary: </label>
    <input type="text" name="summary">

    <label for="author">Author: </label>
    <input type="text" name="author">

    <label for="category">Category: </label>
    <input type="text" name="category">

    <label for="year">Year: </label>
    <input type="text" name="year">

    <label for="id">Article ID: </label>
    <input type="text" name="id">

    <input type="submit" value="Update">

  </form>

</body>
</html> -->
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Update article</title>
    <link href="styles/main.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  
  <form action="/update_article" method="post">
  
      <div id="new_article">
        
        <div >
          <t2>Update article</t2>
        </div>
        
        <div align="center" class="padding">
          <input type="text" id="enter_title" name="title" placeholder="Enter title">
        </div>
                  
        <div align="center" class="padding">
          <textarea type="text" id="enter_summary" name="summary" rows="5" placeholder="Enter summary"></textarea>
        </div>
        
        <div align="center" class="padding">
          <textarea type="text" id="choose_category" name="category" rows="5" placeholder="Enter category"></textarea>
        </div>
                  
        <div align="center" class="padding">
          <input type="text" id="enter_author" name="name" placeholder="Enter authors name">
        </div>
        
        <div align="center" class="padding">
          <input type="text" id="enter_year" name="year" placeholder="Enter year">
        </div>
        
        <div align="center" class="padding">
          <input type="text" id="enter_id" name="id" placeholder="Enter Id">
        </div>
        
        <div align="center" class="padding">
          <input type="submit" class="New_article" value="UPDATE">
        </div>
        
      </div>
    </form>
  </body>
</html>