<%@ page import="backlogend.StoryTheme" %>



<div class="fieldcontain ${hasErrors(bean: storyThemeInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="storyTheme.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${storyThemeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storyThemeInstance, field: 'userStories', 'error')} ">
	<label for="userStories">
		<g:message code="storyTheme.userStories.label" default="User Stories" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${storyThemeInstance?.userStories?}" var="u">
    <li><g:link controller="userStory" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userStory" action="create" params="['storyTheme.id': storyThemeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userStory.label', default: 'UserStory')])}</g:link>
</li>
</ul>

</div>

