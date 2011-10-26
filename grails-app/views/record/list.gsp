
<%@ page import="org.mosaicaustin.giving.Record" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'record.label', default: 'Record')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-record" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-record" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'record.amount.label', default: 'Amount')}" />
					
						<th><g:message code="record.fund.label" default="Fund" /></th>
					
						<g:sortableColumn property="ccType" title="${message(code: 'record.ccType.label', default: 'Cc Type')}" />
					
						<th><g:message code="record.person.label" default="Person" /></th>
					
						<g:sortableColumn property="checkNumber" title="${message(code: 'record.checkNumber.label', default: 'Check Number')}" />
					
						<g:sortableColumn property="processDate" title="${message(code: 'record.processDate.label', default: 'Process Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recordInstanceList}" status="i" var="recordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recordInstance.id}">${fieldValue(bean: recordInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: recordInstance, field: "fund")}</td>
					
						<td>${fieldValue(bean: recordInstance, field: "ccType")}</td>
					
						<td>${fieldValue(bean: recordInstance, field: "person")}</td>
					
						<td>${fieldValue(bean: recordInstance, field: "checkNumber")}</td>
					
						<td><g:formatDate date="${recordInstance.processDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recordInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
