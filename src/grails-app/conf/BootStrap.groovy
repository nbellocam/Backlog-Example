import backlogend.StoryPriority
import backlogend.StoryStatus
import backlogend.StoryTheme
import backlogend.StoryType
import backlogend.User
import backlogend.TheUser

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

		new TheUser(username:"admin", password:"admin", enabled:true).save()
	}
	def destroy = {
	}
}
