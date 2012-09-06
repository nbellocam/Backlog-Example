package backlogend

class StoryStatus {

	String description

	static constraints = {
		description blank:false, unique:true
	}

	public String toString() {
		return this.getDescription();
	}
}
