
<%@ page import="records.Fund" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fund.label', default: 'Fund')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fund" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fund" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fund">

				<g:if test="${fundInstance?.vancoId}">
				<li class="fieldcontain">
					<span id="vancoId-label" class="property-label"><g:message code="fund.vancoId.label" default="Vanco Id" /></span>

						<span class="property-value" aria-labelledby="vancoId-label"><g:fieldValue bean="${fundInstance}" field="vancoId"/></span>

				</li>
				</g:if>

				<g:if test="${fundInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="fund.name.label" default="Name" /></span>

						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${fundInstance}" field="name"/></span>

				</li>
				</g:if>

				<li class="fieldcontain">
					<span id="records-label" class="property-label"><g:message code="fund.records.label" default="Records" /></span>

					<g:set var="records" value="${params.recordsMonth ? fundInstance.getRecordsForMonth(params.int('recordsMonth') - 1,params.recordsYear) : fundInstance.getRecordsForYear(params.recordsYear)}" />
					<g:each in="${records}" var="r">
						<span class="property-value" aria-labelledby="records-label"><g:link controller="record" action="show" id="${r.id}"><g:formatDate format="yyyy-MM-dd" date="${r.processDate}"/> - $${r?.amount.toString().padLeft(7,'_')} from ${r.person.name}</g:link></span>
					</g:each>

					<g:form method="get" action="show" id="${fundInstance.id}">
						<label>
							<span>Month</span>
							<input name="recordsMonth" placeholder="Any Month" value="${params.recordsMonth}"/>
						</label>
						<label>
							<span>Year</span>
							<input name="recordsYear" placeholder="This Year" value="${params.recordsYear}"/>
						</label>
						<input type="submit" value="Change"/>
					</g:form>
				</li>

				<li class="fieldcontain">
					<span id="pledges-label" class="property-label">Pledges</span>

					<g:each in="${fundInstance.getPledgesForYear(params.pledgeYear)}" var="p">
						<span class="property-value" aria-labelledby="pledges-label"><g:link controller="pledge" action="show" id="${p.id}">${p?.amount} from ${p?.person?.name}</g:link></span>
					</g:each>

					<g:form method="get" action="show" id="${fundInstance.id}">
						<label>
							<span>Year</span>
							<input name="pledgeYear" placeholder="This Year" value="${params.pledgeYear}"/>
						</label>
						<input type="submit" value="Change Year"/>
					</g:form>
				</li>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${fundInstance?.id}" />
					<g:link class="edit" action="edit" id="${fundInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
