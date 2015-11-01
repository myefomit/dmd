<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Search results</title>
		<link href="styles/styles.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>	
		<table>
			<td class="table">
				
				%if (rows != []):
					<div id="nothing">
						<a href="/">Take me back</a>
					</div>
				%end
				
				<div id="results">
					%if (rows and rows != []):
						%for row in rows:
					
							<div id="article">
							
								<div>
									<t2><!-- --></t2>
								</div>
								
								<div>
									<t5><!-- --></t5>
								</div>
								
								<div>
									<t4><!-- --></t4>
								</div>
								
								<div>
									<t6><!-- --></t6>
								</div>
								
							</div>
			
						%end
					%else:
						<t2>Nothing for you today, come back soon!</t2>
					%end
				</div>
				
				<div id="nothing">
					<a href="/">Take me back</a>
				</div>
			</td>
		</table>
	</body>
</html>