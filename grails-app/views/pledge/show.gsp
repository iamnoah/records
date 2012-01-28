
<%@ page import="records.Pledge" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pledge.label', default: 'Pledge')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pledge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pledge" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pledge">
			
				<g:if test="${pledgeInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="pledge.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${pledgeInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeInstance?.endMonth}">
				<li class="fieldcontain">
					<span id="endMonth-label" class="property-label"><g:message code="pledge.endMonth.label" default="End Month" /></span>
					
						<span class="property-value" aria-labelledby="endMonth-label"><g:fieldValue bean="${pledgeInstance}" field="endMonth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeInstance?.endYear}">
				<li class="fieldcontain">
					<span id="endYear-label" class="property-label"><g:message code="pledge.endYear.label" default="End Year" /></span>
					
						<span class="property-value" aria-labelledby="endYear-label"><g:fieldValue bean="${pledgeInstance}" field="endYear"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeInstance?.fund}">
				<li class="fieldcontain">
					<span id="fund-label" class="property-label"><g:message code="pledge.fund.label" default="Fund" /></span>
					
						<span class="property-value" aria-labelledby="fund-label"><g:link controller="fund" action="show" id="${pledgeInstance?.fund?.id}">${pledgeInstance?.fund?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="pledge.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${pledgeInstance?.person?.id}">${pledgeInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeInstance?.startMonth}">
				<li class="fieldcontain">
					<span id="startMonth-label" class="property-label"><g:message code="pledge.startMonth.label" default="Start Month" /></span>
					
						<span class="property-value" aria-labelledby="startMonth-label"><g:fieldValue bean="${pledgeInstance}" field="startMonth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pledgeInstance?.startYear}">
				<li class="fieldcontain">
					<span id="startYear-label" class="property-label"><g:message code="pledge.startYear.label" default="Start Year" /></span>
					
						<span class="property-value" aria-labelledby="startYear-label"><g:fieldValue bean="${pledgeInstance}" field="startYear"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pledgeInstance?.id}" />
					<g:link class="edit" action="edit" id="${pledgeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
