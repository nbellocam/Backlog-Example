<%@ page import="backlogend.UserStory"%>



<div
	class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'description', 'error')} required">
	<label for="description"> <g:message
			code="userStory.description.label" default="Description" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="description" required=""
		value="${userStoryInstance?.description}" />
</div>

<g:if test="${ !isCreating }">
	<div
		class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'theme', 'error')} ">
		<label for="theme"> <g:message code="userStory.theme.label"
				default="Theme" />
		</label>
		<g:select id="theme" name="theme.id"
			from="${backlogend.StoryTheme.list()}" optionKey="id"
			value="${userStoryInstance?.theme?.id}" class="many-to-one"
			noSelection="['null': '']" />
	</div>
</g:if>

<div
	class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'points', 'error')} required">
	<label for="points"> <g:message code="userStory.points.label"
			default="Points" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="points" type="number" min="0"
		value="${userStoryInstance.points}" required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'assigner', 'error')} required">
	<label for="assigner"> <g:message
			code="userStory.assigner.label" default="Assigner" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select id="assigner" name="assigner.id"
		from="${backlogend.User.list()}" optionKey="id" required=""
		value="${userStoryInstance?.assigner?.id}" class="many-to-one" />
</div>

<g:if test="${ !isCreating }">
	<div
		class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'comments', 'error')} ">
		<label for="comments"> <g:message
				code="userStory.comments.label" default="Comments" />

		</label>

		<ul class="one-to-many">
			<g:each in="${userStoryInstance?.comments?}" var="c">
				<li><g:link controller="comment" action="show" id="${c.id}">
						${c?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="comment" action="create"
					params="['userStory.id': userStoryInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}
				</g:link></li>
		</ul>

	</div>
</g:if>

<div
	class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'epic', 'error')} ">
	<label for="epic"> <g:message code="userStory.epic.label"
			default="Epic" />

	</label>
	<g:checkBox name="epic" value="${userStoryInstance?.epic}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'owner', 'error')} required">
	<label for="owner"> <g:message code="userStory.owner.label"
			default="Owner" /> <span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${backlogend.User.list()}"
		optionKey="id" required="" value="${userStoryInstance?.owner?.id}"
		class="many-to-one" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'priority', 'error')} required">
	<label for="priority"> <g:message
			code="userStory.priority.label" default="Priority" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select id="priority" name="priority.id"
		from="${backlogend.StoryPriority.list()}" optionKey="id" required=""
		value="${userStoryInstance?.priority?.id}" class="many-to-one" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'status', 'error')} required">
	<label for="status"> <g:message code="userStory.status.label"
			default="Status" /> <span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id"
		from="${backlogend.StoryStatus.list()}" optionKey="id" required=""
		value="${userStoryInstance?.status?.id}" class="many-to-one" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userStoryInstance, field: 'type', 'error')} required">
	<label for="type"> <g:message code="userStory.type.label"
			default="Type" /> <span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id"
		from="${backlogend.StoryType.list()}" optionKey="id" required=""
		value="${userStoryInstance?.type?.id}" class="many-to-one" />
</div>

