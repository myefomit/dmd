<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>{{article['title']}}</title>
		<link href="styles/styles.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>	
		<div id="article">
		
			<div>
				<t2>{{article['title']}}</t2>
			</div>
			
			<div>
				<t6>{{", ".join(article['authors'])}}</t6>
			</div>
			
			<div>
				<t5>{{article['link']}}</t5>
			</div>
								
			<div>
				<t4>{{article['summary']}}...</t4>
			</div>
								
			<div>
				<t6>{{", ".join(article['categories'])}}</t6>
			</div>
								
		</div>
	</body>
</html>