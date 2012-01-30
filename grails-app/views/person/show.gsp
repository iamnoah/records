
<%@ page import="records.Person" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">

				<g:if test="${personInstance?.vancoId}">
				<li class="fieldcontain">
					<span id="vancoId-label" class="property-label"><g:message code="person.vancoId.label" default="Vanco Id" /></span>

						<span class="property-value" aria-labelledby="vancoId-label"><g:fieldValue bean="${personInstance}" field="vancoId"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="person.notes.label" default="Notes" /></span>

						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${personInstance}" field="notes"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.addresses}">
				<li class="fieldcontain">
					<span id="addresses-label" class="property-label"><g:message code="person.addresses.label" default="Addresses" /></span>

						<g:each in="${personInstance.addresses}" var="a">
						<span class="property-value" aria-labelledby="addresses-label"><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${personInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="person.name.label" default="Name" /></span>

						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${personInstance}" field="name"/></span>

				</li>
				</g:if>

				<g:if test="${personInstance?.records}">
				<li class="fieldcontain">
					<span id="records-label" class="property-label"><g:message code="person.records.label" default="Records" /></span>

					<g:set var="records" value="${params.recordsMonth ? personInstance.getRecordsForMonth(params.int('recordsMonth') - 1,params.recordsYear) : personInstance.getRecordsForYear(params.recordsYear)}" />
					<g:each in="${records}" var="r">
						<span class="property-value" aria-labelledby="records-label"><g:link controller="record" action="show" id="${r.id}"><g:formatDate format="yyyy-MM-dd" date="${r.processDate}"/> - $${r?.amount.toString().padLeft(7,'_')} to ${r.fund}</g:link></span>
					</g:each>

					<g:form method="get" action="show" id="${personInstance.id}">
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

					<g:link controller="record" action="create" params="${['person.id':personInstance.id]}">New Record</g:link>
				</li>
				</g:if>

				<li class="fieldcontain">
					<span id="pledges-label" class="property-label">Pledges</span>

					<g:each in="${personInstance.getPledgesForYear(params.pledgeYear)}" var="p">
						<span class="property-value" aria-labelledby="pledges-label"><g:link controller="pledge" action="show" id="${p.id}">${p?.amount} to ${p?.fund?.name}</g:link></span>
					</g:each>

					<g:form method="get" action="show" id="${personInstance.id}">
						<label>
							<span>Year</span>
							<input name="pledgeYear" placeholder="This Year" value="${params.pledgeYear}"/>
						</label>
						<input type="submit" value="Change Year"/>
					</g:form>
				</li>
			</ol>


			<g:form controller="report" method="get">
				<input type="hidden" name="people" value="${personInstance.id}">
				Year: <input type="text" name="year" value="2011">
				<input type="submit" value="Report">
			</g:form>

			<g:form action="moveRecords" method="post">

					<input type="hidden" name="from" value="${personInstance.id}">
					<label>
						Move all records to:
						<g:select name="to" optionValue="name" from="${records.Person.list()}" optionKey="id" required="" class="many-to-one" value="${personInstance.id}"/>
					</label>
					<input type="submit" value="move">
			</g:form>

			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personInstance?.id}" />
					<g:link class="edit" action="edit" id="${personInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
