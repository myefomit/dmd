<h1>Welcome to our app!</h1>
<div>

  <h2>Here you can find any paper you want</h2>

  %if user:
    <div><a href="/sign_out">Sign out</a></div>
    <div><a href="/new_article">Create new article</a></div>
    <div><a href="/update_article">Update article</a></div>
    <div><a href="/delete_article">Delete article</a></div>
  %else:
    <div><a href="/sign_in">Sign in</a></div>
    <div><a href="/sign_up">Sign up</a></div>
  %end

  %if messages:
    <div>
      <span>
        {{messages[0]}}
      </span>
    </div>
  %end

  <form action="search">
    
    <div>
      <label for="name">Author: </label>
      <input type="text" name="name">  
    </div>

    <div>
      <label for="title">Title: </label>
      <input type="text" name="title">  
    </div>

    <div>
      <label for="category">Category: </label>
      <input type="text" name="category">  
    </div>

    <div>
      <label for="">Year: </label>
      <input type="text" name="year">
    </div>

    <div>
      <label for="limit">Limit: </label>
      <input type="text" name="limit">  
    </div>

    <input type="submit" value="Search">

  </form>
</div>