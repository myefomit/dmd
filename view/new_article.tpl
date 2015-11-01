<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Create new article</title>
		<link href="styles/styles.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
	
		<div id="new_article">
			
			<div >
				<t2>Create new article</t2>
			</div>
			
			<div align="center" class="padding">
				<input type="text" id="enter_title" name="title" placeholder="Enter title">
			</div>
								
			<div align="center" class="padding">
				<textarea type="text" id="enter_summary" name="title" rows="5" placeholder="Enter summary"></textarea>
			</div>
			
			<div class="padding">
				<select class="option_font" name="category" id="choose_category">
					<option selected value="0">Choose the category</option>
					<option value="math.AP">math.AP</option>
				</select>
			</div>
								
			<div align="center" class="padding">
				<input type="text" id="enter_author" name="title" placeholder="Enter authors name">
			</div>
			
			<div align="center" class="padding">
				<button type="submit" class="Create"><t1>CREATE</t1></button>
			</div>
			
		</div>
	</body>
</html>