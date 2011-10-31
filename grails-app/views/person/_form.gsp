<%@ page import="records.Person" %>


<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="person.name.label" default="Name (Last, First)" />
		
	</label>
	<g:textField name="name" value="${personInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="person.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" value="${personInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'addresses', 'error')} ">
	<label for="addresses">
		<g:message code="person.addresses.label" default="Addresses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.addresses?}" var="a">
    <li><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="address" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
</li>
</ul>

</div>


<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'records', 'error')} ">
	<label for="records">
		<g:message code="person.records.label" default="Records" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.records?}" var="r">
    <li><g:link controller="record" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="record" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'record.label', default: 'Record')])}</g:link>
</li>
</ul>

</div>

