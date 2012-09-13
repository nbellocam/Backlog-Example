package backlogend

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class HomeController {
	/**
	 * Dependency injection for the authenticationTrustResolver.
	 */
	def authenticationTrustResolver

	/**
	 * Dependency injection for the springSecurityService.
	 */
	def springSecurityService

	def index() {
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		render view:"index",  model: [postUrl: postUrl]
	}
}
