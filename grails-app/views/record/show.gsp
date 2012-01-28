
<%@ page import="records.Record" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'record.label', default: 'Record')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-record" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-record" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list record">

				<g:if test="${recordInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="record.amount.label" default="Amount" /></span>

						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${recordInstance}" field="amount"/></span>

				</li>
				</g:if>

				<g:if test="${recordInstance?.fund}">
				<li class="fieldcontain">
					<span id="fund-label" class="property-label"><g:message code="record.fund.label" default="Fund" /></span>

						<span class="property-value" aria-labelledby="fund-label"><g:link controller="fund" action="show" id="${recordInstance?.fund?.id}">${recordInstance?.fund?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${recordInstance?.ccType}">
				<li class="fieldcontain">
					<span id="ccType-label" class="property-label"><g:message code="record.ccType.label" default="Cc Type" /></span>

						<span class="property-value" aria-labelledby="ccType-label"><g:fieldValue bean="${recordInstance}" field="ccType"/></span>

				</li>
				</g:if>

				<g:if test="${recordInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="record.person.label" default="Person" /></span>

						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${recordInstance?.person?.id}">${recordInstance?.person?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${recordInstance?.checkNumber}">
				<li class="fieldcontain">
					<span id="checkNumber-label" class="property-label"><g:message code="record.checkNumber.label" default="Check Number" /></span>

						<span class="property-value" aria-labelledby="checkNumber-label"><g:fieldValue bean="${recordInstance}" field="checkNumber"/></span>

				</li>
				</g:if>

				<g:if test="${recordInstance?.processDate}">
				<li class="fieldcontain">
					<span id="processDate-label" class="property-label"><g:message code="record.processDate.label" default="Process Date" /></span>

						<span class="property-value" aria-labelledby="processDate-label"><g:formatDate date="${recordInstance?.processDate}" /></span>

				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${recordInstance?.id}" />
					<g:link class="edit" action="edit" id="${recordInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
