<!--<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="styles/main.css">
  <meta charset="UTF-8">
  <title>Search</title>
</head>
<body>

  <div class="main">

    <div class="navs">
      %if user:
        <div><a href="/sign_out">Sign out</a></div>
        <div><a href="/new_article">Create new article</a></div>
        <div><a href="/update_article">Update article</a></div>
        <div><a href="/delete_article">Delete article</a></div>
      %else:
        <div><a href="/sign_in">Sign in</a></div>
        <div><a href="/sign_up">Sign up</a></div>
      %end  
    </div>

    %if messages:
      <div class="messages">
        <span>
          {{messages[0]}}
        </span>
      </div>
    %end

    <form action="search" class="search">
      
      <div class="input">
        <label for="name">Author: </label>
        <input type="text" name="name">  
      </div>

      <div class="input">
        <label for="title">Title: </label>
        <input type="text" name="title">  
      </div>

      <div class="input">
        <label for="category">Category: </label>
        <input type="text" name="category">  
      </div>

      <div class="input">
        <label for="">Year: </label>
        <input type="text" name="year">
      </div>

      <div class="input">
        <label for="limit">Limit: </label>
        <input type="text" name="limit">  
      </div>

      <div class="select">
        <label for="order-by">Order by: </label>
        <select name="order-by">
          <option value="none">None</option>
          <option value="year">Year</option>
          <option value="category">Category</option>
        </select>
      </div>

      <div class="select">
        <label for="order">Order: </label>
        <select name="order">
          <option value="asc">Ascending</option>
          <option value="desc">Descending</option>
        </select>
      </div>

      <input type="submit" value="Search" class="search-submit">

    </form>
  </div>
</body>
</html>-->
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="styles/main.css">
  <meta charset="UTF-8">
  <title>Search</title>
</head>
<body>

  <div class="main">

    <div class="navs">
      %if user:
        <div class="SignOut"><a href="/sign_out"><t1>Sign out</t1></a></div>
        <div class="Create"><a href="/new_article"><t1>Create</t1></a></div>
        <div class="Update"><a href="/update_article"><t1>Update</t1></a></div>
        <div class="Delete"><a href="/delete_article"><t1>Delete</t1></a></div>
      %else:
        <div class="SignIn"><a href="/sign_in"><t1>Sign in</t1></a></div>
        <div class="SignUp"><a href="/sign_up"><t1>Sign up</t1></a></div>
      %end  
    </div>

    %if messages:
      <div class="messages">
        <span>
          {{messages[0]}}
        </span>
      </div>
    %end
  
  <form align="center" action="search" class="search">
  
  <div>
    <t2>Search the article</t2>
  </div>
  
  <div id="comment">
    <t3>"Please Search by typing what you are looking for"</t3>
  </div>
      
      <div class="input">
        <input type="text" id="name" name="name" placeholder="Author">  
      </div>

      <div class="input">
        <input type="text" id="title" name="title" placeholder="Title">  
      </div>

      <div class="input">
        <input type="text" id="category" name="category" placeholder="Category">  
      </div>

      <div class="input">
        <input type="text" id="year" name="year" placeholder="Year">
      </div>

      <div class="input">
        <input type="text" id="limit" name="limit" placeholder="Limit">  
      </div>

      <div class="select">
        <select class="option_font" id="order-by" name="order-by">
          <option selected value="none">None</option>
          <option value="year">Year</option>
          <option value="category">Category</option>
        </select>
      </div>

      <div class="select">
        <select class="option_font" id="order" name="order">
          <option value="asc">Ascending</option>
          <option value="desc">Descending</option>
        </select>
      </div>
    
    <div class="padding">
      <button type="submit" id="submit" class="Submit"><t1>SEARCH</t1></button>
    </div>
    
    </form>
  </div>
</body>
</html>