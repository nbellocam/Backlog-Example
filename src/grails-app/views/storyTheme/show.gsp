
<%@ page import="backlogend.StoryTheme" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'storyTheme.label', default: 'StoryTheme')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-storyTheme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-storyTheme" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list storyTheme">
			
				<g:if test="${storyThemeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="storyTheme.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${storyThemeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storyThemeInstance?.userStories}">
				<li class="fieldcontain">
					<span id="userStories-label" class="property-label"><g:message code="storyTheme.userStories.label" default="User Stories" /></span>
					
						<g:each in="${storyThemeInstance.userStories}" var="u">
						<span class="property-value" aria-labelledby="userStories-label"><g:link controller="userStory" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${storyThemeInstance?.id}" />
					<g:link class="edit" action="edit" id="${storyThemeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
