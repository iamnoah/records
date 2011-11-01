<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Import Error(s)</title>
	</head>
	<body>
		<h1>Vanco Import Error(s)</h1>
		<h2>People</h2>
		<g:each in="${people}">
<g:hasErrors bean="${it}">
	<h3>${it.name}</h3>
    <g:renderErrors bean="${it}" as="list"/>
</g:hasErrors>
		</g:each>
		<h2>Records</h2>
		<g:each in="${records}">
<g:hasErrors bean="${it}">
	<h3>${it?.person?.name} - ${it.amount} - ${it.processDate}</h3>
    <g:renderErrors bean="${it}" as="list"/>
</g:hasErrors>
		</g:each>
	</body>
</html>