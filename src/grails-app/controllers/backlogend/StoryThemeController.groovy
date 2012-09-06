package backlogend

import org.springframework.dao.DataIntegrityViolationException

class StoryThemeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [storyThemeInstanceList: StoryTheme.list(params), storyThemeInstanceTotal: StoryTheme.count()]
    }

    def create() {
        [storyThemeInstance: new StoryTheme(params)]
    }

    def save() {
        def storyThemeInstance = new StoryTheme(params)
        if (!storyThemeInstance.save(flush: true)) {
            render(view: "create", model: [storyThemeInstance: storyThemeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'storyTheme.label', default: 'StoryTheme'), storyThemeInstance.id])
        redirect(action: "show", id: storyThemeInstance.id)
    }

    def show(Long id) {
        def storyThemeInstance = StoryTheme.get(id)
        if (!storyThemeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storyTheme.label', default: 'StoryTheme'), id])
            redirect(action: "list")
            return
        }

        [storyThemeInstance: storyThemeInstance]
    }

    def edit(Long id) {
        def storyThemeInstance = StoryTheme.get(id)
        if (!storyThemeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storyTheme.label', default: 'StoryTheme'), id])
            redirect(action: "list")
            return
        }

        [storyThemeInstance: storyThemeInstance]
    }

    def update(Long id, Long version) {
        def storyThemeInstance = StoryTheme.get(id)
        if (!storyThemeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storyTheme.label', default: 'StoryTheme'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (storyThemeInstance.version > version) {
                storyThemeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'storyTheme.label', default: 'StoryTheme')] as Object[],
                          "Another user has updated this StoryTheme while you were editing")
                render(view: "edit", model: [storyThemeInstance: storyThemeInstance])
                return
            }
        }

        storyThemeInstance.properties = params

        if (!storyThemeInstance.save(flush: true)) {
            render(view: "edit", model: [storyThemeInstance: storyThemeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'storyTheme.label', default: 'StoryTheme'), storyThemeInstance.id])
        redirect(action: "show", id: storyThemeInstance.id)
    }

    def delete(Long id) {
        def storyThemeInstance = StoryTheme.get(id)
        if (!storyThemeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storyTheme.label', default: 'StoryTheme'), id])
            redirect(action: "list")
            return
        }

        try {
            storyThemeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'storyTheme.label', default: 'StoryTheme'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'storyTheme.label', default: 'StoryTheme'), id])
            redirect(action: "show", id: id)
        }
    }
}
