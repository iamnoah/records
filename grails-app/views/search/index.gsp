<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Search Results</title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>	
		<div id="main">
		    <g:set var="haveQuery" value="${params.q?.trim()}" />
		    <g:set var="haveResults" value="${searchResult?.results}" />
		    <div class="title">
		      <span>
		        <g:if test="${haveQuery && haveResults}">
		          Showing <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
		          results for <strong>${params.q}</strong>
		        </g:if>
		        <g:else>
		        &nbsp;
		        </g:else>
		      </span>
		    </div>

		    <g:if test="${haveQuery && !haveResults && !parseException}">
		      <p>Nothing matched your query - <strong>${params.q}</strong></p>
		      <g:if test="${!searchResult?.suggestedQuery}">
		        <p>Suggestions:</p>
		        <ul>
		          <li>Try a suggested query: <g:link controller="searchable" action="index" params="[q: params.q, suggestQuery: true]">Search again with the <strong>suggestQuery</strong> option</g:link><br />
		            <em>Note: Suggestions are only available when classes are mapped with <strong>spellCheck</strong> options, either at the class or property level.<br />
				The simplest way to do this is add <strong>spellCheck "include"</strong> to the domain class searchable mapping closure.<br />
		                See the plugin/Compass documentation Mapping sections for details.</em>
		          </li>
		        </ul>
		      </g:if>
		    </g:if>

		    <g:if test="${searchResult?.suggestedQuery}">
		      <p>Did you mean <g:link controller="searchable" action="index" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
		    </g:if>

		    <g:if test="${parseException}">
		      <p>Your query - <strong>${params.q}</strong> - is not valid.</p>
		      <p>Suggestions:</p>
		      <ul>
		        <li>Fix the query: see <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples</li>
		        <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
		          <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.q)}</strong></em><br />
		              <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
		          </li>
		          <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.q)}</strong></em><br />
		              <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
		              <em>Or use the Searchable Plugin's <strong>escape</strong> option: <g:link controller="searchable" action="index" params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
		          </li>
		        </g:if>
		      </ul>
		    </g:if>


     <g:if test="${haveResults}">
		<div id="list-record" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<tbody>
		        <g:each var="result" status="i" in="${searchResult.results}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
				            <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
				            <g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id)}" />
				            <g:set var="desc" value="${result.toString()}" />
				            <g:if test="${desc.size() > 120}"><g:set var="desc" value="${desc[0..120] + '...'}" /></g:if>
				            <div class="desc"><a href="${link}">${desc.encodeAsHTML()}</a></div>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
		          <g:if test="${haveResults}">
		              Page:
		              <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
		              <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
		              <g:else><g:paginate controller="search" action="index" params="[q: params.q]" total="${searchResult.total}" prev="&lt; previous" next="next &gt;"/></g:else>
		          </g:if>
			</div>
		</div>
    </g:if>
	</body>
</html>
