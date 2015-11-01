<!DOCTYPE html>
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
</html>