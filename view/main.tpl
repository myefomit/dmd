<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Project</title>
		<link href="styles/styles.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
		<table>
			<td class="table">
				<div id="buttons">
					<div id="SignUp" class="SignUp">
						<a href="sign up.tpl"/><t1>Sign Up</t1></a>
					</div>
					<div id="SignIn" class="SignIn">
						<a href="sign in.tpl"/><t1>Sign In</t1></a>
					</div>
				</div>
				<form action="search">
					<div id="body">
						<div align="center"><t2>Search the article</t2>
							<div align="center" class="padding">
								<input type="search" id="title" name="title" placeholder="Search">
							</div>
							
							<div align="center" id="comment">
								<t3>"Please Search by typing what you are looking for"</t3>
							</div>
						
						<div align="center" class="padding">
							<button type="submit" id="submit" class="Submit"><t1>SEARCH</t1></button>
						</div>
						
						<div align="center">
							<button type="button"  id="more" class="More">
									<img id="arrow" src="images/arrow.png">
							</button>
						</div>
					</div>
					
						<div align="center" id="hidden">
							<div class="options" align="center"><t2>Author</t2>
								<div align="center" class="padding">
									<input type="search" id="name" name="name" placeholder="Search">
								</div>
							</div>
							
							<div class="options" align="center"><t2>Category</t2>
								<div align="center" class="padding">
									<input type="search" id="category" name="category" placeholder="Search">
								</div>
							</div>
							
							<div class="options" align="center"><t2>Date</t2>
								<div class="padding">
									<select class="option_font" name="year" id="year">
										<option selected value="0">Choose the year</option>
										<option value="2015">2015</option>
										<option value="2014">2014</option>
										<option value="2013">2013</option>
										<option value="2012">2012</option>
										<option value="2011">2011</option>
										<option value="2010">2010</option>
										<option value="2009">2009</option>
										<option value="2008">2008</option>
										<option value="2007">2007</option>
										<option value="2006">2006</option>
										<option value="2005">2005</option>
										<option value="2004">2004</option>
										<option value="2003">2003</option>
										<option value="2002">2002</option>
										<option value="2001">2001</option>
										<option value="2000">2000</option>
										<option value="1999">1999</option>
										<option value="1998">1998</option>
										<option value="1997">1997</option>
									</select>
								</div>
							</div>
							
							<div class="options" align="center"><t2>Limit</t2>
								<div align="center" class="padding">
									<input type="search" id="limit" name="limit" placeholder="Search">
								</div>
							</div>
						
						</div>
					</div>
				</form>
			</td>
		</table>
	</body>
</html>