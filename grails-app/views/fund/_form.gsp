<%@ page import="org.mosaicaustin.giving.Fund" %>



<div class="fieldcontain ${hasErrors(bean: fundInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="fund.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${fundInstance?.name}"/>
</div>

