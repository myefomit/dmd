<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign up</title>
</head>
<body>

  <div class="messages">

    %if messages:
      %for message in messages:
      <div>
        <span class="alert">
          {{message}}
        </span>
      </div>
      %end
    %end  

  </div>

  <form action="sign_up" method="post">
    
    <label for="username">Username: </label>
    <input type="text" name="username">

    <label for="password">Password: </label>
    <input type="password" name="password">

    <input type="submit" value="sign up">

  </form>
</body>
</html>