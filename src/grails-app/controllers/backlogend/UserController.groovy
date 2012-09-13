package backlogend

import grails.plugins.springsecurity.Secured

@Secured("hasRole('MANAGE_USERS')")
class UserController {
	def scaffold = true
}
