
<%@ page import="backlogend.UserStory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userStory.label', default: 'UserStory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userStory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userStory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userStory">
			
				<g:if test="${userStoryInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="userStory.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${userStoryInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userStoryInstance?.theme}">
				<li class="fieldcontain">
					<span id="theme-label" class="property-label"><g:message code="userStory.theme.label" default="Theme" /></span>
					
						<span class="property-value" aria-labelledby="theme-label"><g:link controller="storyTheme" action="show" id="${userStoryInstance?.theme?.id}">${userStoryInstance?.theme?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userStoryInstance?.points}">
				<li class="fieldcontain">
					<span id="points-label" class="property-label"><g:message code="userStory.points.label" default="Points" /></span>
					
						<span class="property-value" aria-labelledby="points-label"><g:fieldValue bean="${userStoryInstance}" field="points"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userStoryInstance?.assigner}">
				<li class="fieldcontain">
					<span id="assigner-label" class="property-label"><g:message code="userStory.assigner.label" default="Assigner" /></span>
					
						<span class="property-value" aria-labelledby="assigner-label">${userStoryInstance?.assigner?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${userStoryInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="userStory.comments.label" default="Comments" /></span>
					
						<g:each in="${userStoryInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userStoryInstance?.epic}">
				<li class="fieldcontain">
					<span id="epic-label" class="property-label"><g:message code="userStory.epic.label" default="Epic" /></span>
					
						<span class="property-value" aria-labelledby="epic-label"><g:formatBoolean boolean="${userStoryInstance?.epic}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userStoryInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="userStory.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label">${userStoryInstance?.owner?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${userStoryInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="userStory.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label">${userStoryInstance?.priority?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${userStoryInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="userStory.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label">${userStoryInstance?.status?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${userStoryInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="userStory.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label">${userStoryInstance?.type?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userStoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${userStoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
