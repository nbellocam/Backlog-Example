
<%@ page import="backlogend.UserStory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userStory.label', default: 'UserStory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userStory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userStory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'userStory.description.label', default: 'Description')}" />
					
						<th><g:message code="userStory.theme.label" default="Theme" /></th>
					
						<g:sortableColumn property="points" title="${message(code: 'userStory.points.label', default: 'Points')}" />
					
						<th><g:message code="userStory.assigner.label" default="Assigner" /></th>
					
						<g:sortableColumn property="epic" title="${message(code: 'userStory.epic.label', default: 'Epic')}" />
					
						<th><g:message code="userStory.owner.label" default="Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userStoryInstanceList}" status="i" var="userStoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userStoryInstance.id}">${fieldValue(bean: userStoryInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: userStoryInstance, field: "theme")}</td>
					
						<td>${fieldValue(bean: userStoryInstance, field: "points")}</td>
					
						<td>${fieldValue(bean: userStoryInstance, field: "assigner")}</td>
					
						<td><g:formatBoolean boolean="${userStoryInstance.epic}" /></td>
					
						<td>${fieldValue(bean: userStoryInstance, field: "owner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userStoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
