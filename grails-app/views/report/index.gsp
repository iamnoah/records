<%@ page import="records.Record" %>
<!doctype html>
<html>
	<head>
		<title>Statements</title>
		<link rel="stylesheet" type="text/css" href="/records/css/statements.css">
	</head>
	<body>
		<g:each in="${people}" var="person">
<div class="statement">
	<address>
	MOSAIC<br>
	P.O. Box 4764<br>
	Austin, TX 78765-4764<br>
	Federal Tax ID # 75-2986591
	</address>

	<h1>CONTRIBUTION STATEMENT</h1>

	<dl>
		<dt>REPORTING PERIOD:
		<dd>January 1, ${year} – December 31, ${year}
		<dt>NAME:
		<dd>${person.firstName} ${person.lastName}
		<dt>ADDRESS:
		<dd><address><g:each in="${person.addresses.find().toAddressString().split('\n')}">${it}<br/></g:each></address>
	</dl>

	<table class="records">
		<g:set var="records" value="${person.getRecordsForYear(year)}" />
		<thead>
			<tr>
				<th class="date">Date
				<th class="amount">Amount
				<!--th class="fund">Fund-->
		<tfoot>
			<tr>
				<th class="total">Total
				<td colspan=2 class="total">$${records*.amount.sum()}
		<tbody>
			<g:each in="${records}" var="record">
			<tr>
				<td class="date">${record.processDate.format('MM/dd')}
				<td class="amount">$${record.amount}
				<!--td class="fund">${record.fund.name}-->
			</g:each>
	</table>

	<p>Thank you for your continued support of the ministries of Mosaic.  In compliance with IRS Code Section 170(f)(8), this statement serves as verification that goods or services, if any, provided by Mosaic in return for your contribution consisted entirely of intangible religious benefits.  Therefore, these contributions are fully deductible for tax purposes.</p>

	<p>This statement reflects your total financial contribution to the work and ministries of Mosaic during 2011.  Should there be questions or comments in regard to the information shown on this statement, please email treasurer@mosaicaustin.org or call (512) 814-5619.</p>

</div>
		</g:each>
<!--
<pre><g:each in="${people}" var="person">"${person.firstName} ${person.lastName}
${person.addresses.find().toAddressString()}",
</g:each></pre>
-->
	</body>
</html>
