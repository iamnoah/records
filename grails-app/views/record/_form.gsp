<%@ page import="records.Record" %>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="record.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" optionValue="name" from="${records.Person.list()}" optionKey="id" required="" value="${recordInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="record.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="amount" min="0.0" max="1E+6" step="0.01" required="" value="${fieldValue(bean: recordInstance, field: 'amount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'fund', 'error')} required">
	<label for="fund">
		<g:message code="record.fund.label" default="Fund" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fund" name="fund.id" from="${records.Fund.list()}" optionKey="id" optionValue="${{"$it.vancoId: $it.name"}}" required="" value="${recordInstance?.fund?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'ccType', 'error')} ">
	<label for="ccType">
		<g:message code="record.ccType.label" default="Cc Type" />
		
	</label>
	<g:textField name="ccType" value="${recordInstance?.ccType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'checkNumber', 'error')} ">
	<label for="checkNumber">
		<g:message code="record.checkNumber.label" default="Check Number" />
		
	</label>
	<g:textField name="checkNumber" value="${recordInstance?.checkNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recordInstance, field: 'processDate', 'error')} required">
	<label for="processDate">
		<g:message code="record.processDate.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<span class="datePicker">
		<input class="dateEntry" value="${recordInstance?.processDate?.format('MM/dd/yyyy')}"  />
		<g:datePicker class="picker" name="processDate" precision="day"  value="${recordInstance?.processDate}"  />
	</span>
</div>

