<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Sign Up</title>
		<link href="styles/styles.css" rel="stylesheet" type="text/css">
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
			<div id="body" align="center">
				
				<div><t2>Join Us</t2>
					<div align="center" class="padding">
						<input type="search" id="login" name="username" placeholder="Login">
					</div>
				</div>
				
				<div align="center" class="padding">
					<input type="search" id="password" name="password" placeholder="Password">
				</div>
				
				<div align="center" class="padding">
					<button type="submit" id="submit" class="Submit"><t1>Submit</t1></button>
				</div>
				
			</div>
		</form>
	</body>
</html>