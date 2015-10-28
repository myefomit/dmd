<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="styles/styles.css">
  <title>Велком-хуелком</title>
</head>
<body>
<h1>Welcome to our app!</h1>
<div>
  <form action="search">
    <h2>Here you can find any paper you want</h2>
   
	<div id="body">
		<div align="center">
		
		<div align="center"><t4>Search the article</t4>
			<div align="center" class="padding">
				<input type="search" id="title" name="title" placeholder="Search"> <!-- id="title" -->
			</div>
		</div>
		
			<div class="support"><t4>Author</t4>
				<div align="center" class="padding">
					<input type="search" id="name" name="name" placeholder="Search"> <!-- id="name" -->
				</div>
			</div>


			<div class="support"><t4>Category</t4>
				<div align="center" class="padding">
					<input type="search" id="category" name="category" placeholder="Search"> <!-- id="category" -->
				</div>
			</div>

			<div class="support"><t4>Year</t4>
				<div class="padding">
					<select class="option_font" name="year" id="year"> <!-- id="year" -->
						<option selected value="choose">Choose the year</option>
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

			<div class="support"><t4>Limit</t4>
				<div align="center" class="padding">
					<input type="search" id="limit" name="limit" placeholder="Search"> <!-- id="limit" -->
				</div>
			</div>

		<div align="center" class="padding">
			<button type="submit" id="SUBMIT" class="Submit"><t1>SEARCH</t1></button>
		</div>
  </form>
</div>	
</div>
</div>
</body>
</html>