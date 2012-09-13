package backlogend

import org.apache.commons.lang.builder.HashCodeBuilder

class TheUserRole implements Serializable {

	TheUser theUser
	Role role

	boolean equals(other) {
		if (!(other instanceof TheUserRole)) {
			return false
		}

		other.theUser?.id == theUser?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (theUser) builder.append(theUser.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static TheUserRole get(long theUserId, long roleId) {
		find 'from TheUserRole where theUser.id=:theUserId and role.id=:roleId',
			[theUserId: theUserId, roleId: roleId]
	}

	static TheUserRole create(TheUser theUser, Role role, boolean flush = false) {
		new TheUserRole(theUser: theUser, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(TheUser theUser, Role role, boolean flush = false) {
		TheUserRole instance = TheUserRole.findByTheUserAndRole(theUser, role)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(TheUser theUser) {
		executeUpdate 'DELETE FROM TheUserRole WHERE theUser=:theUser', [theUser: theUser]
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM TheUserRole WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'theUser']
		version false
	}
}
