import backlogend.*

class BootStrap {

	def init = { servletContext ->

		new StoryType(description:"Feature").save()
		new StoryType(description:"Bug").save()
		new StoryType(description:"Technical work").save()
		new StoryType(description:"Knowledge acquisition").save()

		new StoryStatus(description:"To do").save()
		new StoryStatus(description:"In process").save()
		new StoryStatus(description:"To verify").save()
		new StoryStatus(description:"Done").save()
		new StoryStatus(description:"Blocked").save()

		new StoryPriority(description:"Blocker").save()
		new StoryPriority(description:"Critical").save()
		new StoryPriority(description:"Major").save()
		new StoryPriority(description:"Minor").save()
		new StoryPriority(description:"Trivial").save()

		new User(name:"Nicolas").save()
		new User(name:"Marcos").save()
		new User(name:"Pablo").save()
		new User(name:"Mauro").save()
		
		new StoryTheme(description:"Iteration 1").save()
		new StoryTheme(description:"Iteration 2").save()
		new StoryTheme(description:"Iteration 3").save()
		new StoryTheme(description:"Iteration 4").save()
		new StoryTheme(description:"Iteration 5").save()

		// create roles
		Role role_users = new Role(authority:"MANAGE_USERS").save()
		Role role_comments = new Role(authority:"MANAGE_COMMENTS").save()
		Role role_stories = new Role(authority:"MANAGE_USER_STORIES").save()
		Role role_user_themes = new Role(authority:"MANAGE_USER_THEMES").save()

		// create two users, admin and poweradmin
		TheUser admin = new TheUser(username:"admin", password:"admin", enabled:true).save()
		TheUser poweradmin = new TheUser(username:"poweradmin", password:"poweradmin", enabled:true).save()

		// power admin can do everything he wants
		TheUserRole.create(poweradmin, role_users)
		TheUserRole.create(poweradmin, role_comments)
		TheUserRole.create(poweradmin, role_stories)
		TheUserRole.create(poweradmin, role_user_themes)

		// admin cannot view/list/create new users
		TheUserRole.create(admin, role_comments)
		TheUserRole.create(admin, role_stories)
		TheUserRole.create(admin, role_user_themes)
	}
	def destroy = {
	}
}
