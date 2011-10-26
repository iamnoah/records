<%@ page import="org.mosaicaustin.giving.Address" %>


<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="address.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${org.mosaicaustin.giving.Person.list()}" optionKey="id" required="" value="${addressInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'line1', 'error')} ">
	<label for="line1">
		<g:message code="address.line1.label" default="Line1" />
		
	</label>
	<g:textField name="line1" value="${addressInstance?.line1}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'line2', 'error')} ">
	<label for="line2">
		<g:message code="address.line2.label" default="Line2" />
		
	</label>
	<g:textField name="line2" value="${addressInstance?.line2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${addressInstance?.city}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="address.state.label" default="State" />
		
	</label>
	<g:textField name="state" value="${addressInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zip', 'error')} ">
	<label for="zip">
		<g:message code="address.zip.label" default="Zip" />
		
	</label>
	<g:textField name="zip" value="${addressInstance?.zip}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="address.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${addressInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="address.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${addressInstance?.email}"/>
</div>
