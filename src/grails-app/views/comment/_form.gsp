<%@ page import="backlogend.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'text', 'error')} required">
	<label for="text">
		<g:message code="comment.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="text" required="" value="${commentInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'story', 'error')} required">
	<label for="story">
		<g:message code="comment.story.label" default="Story" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="story" name="story.id" from="${backlogend.UserStory.list()}" optionKey="id" required="" value="${commentInstance?.story?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="comment.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${backlogend.User.list()}" optionKey="id" required="" value="${commentInstance?.user?.id}" class="many-to-one"/>
</div>

