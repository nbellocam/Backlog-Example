package backlogend

class Comment {

	String text

	User user
	static belongsTo = [story : UserStory]

	static constraints = {  text blank: false }

	public String toString() {
		return this.getText() + " by " + this.getUser();
	}
}
