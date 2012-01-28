<%@ page import="records.Pledge" %>



<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="pledge.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="amount" min="1" required="" value="${fieldValue(bean: pledgeInstance, field: 'amount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'endMonth', 'error')} required">
	<label for="endMonth">
		<g:message code="pledge.endMonth.label" default="End Month" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="endMonth" required="" value="${fieldValue(bean: pledgeInstance, field: 'endMonth')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'endYear', 'error')} required">
	<label for="endYear">
		<g:message code="pledge.endYear.label" default="End Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="endYear" required="" value="${fieldValue(bean: pledgeInstance, field: 'endYear')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'fund', 'error')} required">
	<label for="fund">
		<g:message code="pledge.fund.label" default="Fund" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fund" name="fund.id" from="${records.Fund.list()}" optionKey="id" required="" value="${pledgeInstance?.fund?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="pledge.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${records.Person.list()}" optionKey="id" required="" value="${pledgeInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'startMonth', 'error')} required">
	<label for="startMonth">
		<g:message code="pledge.startMonth.label" default="Start Month" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="startMonth" required="" value="${fieldValue(bean: pledgeInstance, field: 'startMonth')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pledgeInstance, field: 'startYear', 'error')} required">
	<label for="startYear">
		<g:message code="pledge.startYear.label" default="Start Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="startYear" required="" value="${fieldValue(bean: pledgeInstance, field: 'startYear')}"/>
</div>

