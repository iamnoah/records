
<%@ page import="records.Pledge" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pledge.label', default: 'Pledge')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pledge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pledge" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'pledge.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="endMonth" title="${message(code: 'pledge.endMonth.label', default: 'End Month')}" />
					
						<g:sortableColumn property="endYear" title="${message(code: 'pledge.endYear.label', default: 'End Year')}" />
					
						<th><g:message code="pledge.fund.label" default="Fund" /></th>
					
						<th><g:message code="pledge.person.label" default="Person" /></th>
					
						<g:sortableColumn property="startMonth" title="${message(code: 'pledge.startMonth.label', default: 'Start Month')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pledgeInstanceList}" status="i" var="pledgeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pledgeInstance.id}">${fieldValue(bean: pledgeInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: pledgeInstance, field: "endMonth")}</td>
					
						<td>${fieldValue(bean: pledgeInstance, field: "endYear")}</td>
					
						<td>${fieldValue(bean: pledgeInstance, field: "fund")}</td>
					
						<td>${fieldValue(bean: pledgeInstance, field: "person")}</td>
					
						<td>${fieldValue(bean: pledgeInstance, field: "startMonth")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pledgeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
