<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Import</title>
	</head>
	<body>
		<h1>Import Vanco Data</h1>
		<g:if test="${errors}">
			<ul class="errors">
				<g:each in="${errors}">
					<li>${it}</li>
				</g:each>
			</ul>
		</g:if>
		<p>Download the Daily Processing report with 
			Show Customer Address and Include Funds set to Yes 
			and Report Format set to CSV.</p>
		<g:uploadForm action="uploadVanco">
	        <input type="file" name="data" accept="text/csv" />
	        <input type="submit" />
	    </g:uploadForm>
	    
	    <g:form action="uploadVanco" method="post">
	    	<label>
	    		<span>or Paste it here:</span>
		        <textarea name="dataString"></textarea>
	    	</label>
	        <input type="submit" />
	    </g:form>
	</body>
</html>