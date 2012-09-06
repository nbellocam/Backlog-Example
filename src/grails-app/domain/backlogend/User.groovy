package backlogend

class User {

	String name

	static constraints = {
		name blank:false, unique:true
	}

	public String toString() {
		return this.getName();
	}
}
