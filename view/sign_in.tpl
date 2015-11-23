<!-- <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign in</title>
</head>
<body>

  <form action="sign_in" method="post">
    
    <label for="username">Username: </label>
    <input type="text" name="username">

    <label for="password">Password: </label>
    <input type="password" name="password">

    <input type="submit" value="sign in">

  </form>
  
</body>
</html> -->
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Sign In</title>
    <link href="styles/main.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>  
    <form action="sign_in" method="post">
      <div id="body" align="center">
        
        <div><t2>Sign In</t2>
          <div align="center" class="padding">
            <input type="text" id="login" name="username" placeholder="Login">
          </div>
        </div>
        
        <div align="center" class="padding">
          <input type="password" id="password" name="password" placeholder="Password">
        </div>
        
        <div align="center" class="padding">
          <input type="submit" id="submit" class="Submit" value="SUBMIT">
        </div>
        
      </div>
    </form>
  </body>
</html>