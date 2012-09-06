package backlogend



import org.junit.*
import grails.test.mixin.*

@TestFor(StoryThemeController)
@Mock(StoryTheme)
class StoryThemeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/storyTheme/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.storyThemeInstanceList.size() == 0
        assert model.storyThemeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.storyThemeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.storyThemeInstance != null
        assert view == '/storyTheme/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/storyTheme/show/1'
        assert controller.flash.message != null
        assert StoryTheme.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/storyTheme/list'

        populateValidParams(params)
        def storyTheme = new StoryTheme(params)

        assert storyTheme.save() != null

        params.id = storyTheme.id

        def model = controller.show()

        assert model.storyThemeInstance == storyTheme
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/storyTheme/list'

        populateValidParams(params)
        def storyTheme = new StoryTheme(params)

        assert storyTheme.save() != null

        params.id = storyTheme.id

        def model = controller.edit()

        assert model.storyThemeInstance == storyTheme
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/storyTheme/list'

        response.reset()

        populateValidParams(params)
        def storyTheme = new StoryTheme(params)

        assert storyTheme.save() != null

        // test invalid parameters in update
        params.id = storyTheme.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/storyTheme/edit"
        assert model.storyThemeInstance != null

        storyTheme.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/storyTheme/show/$storyTheme.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        storyTheme.clearErrors()

        populateValidParams(params)
        params.id = storyTheme.id
        params.version = -1
        controller.update()

        assert view == "/storyTheme/edit"
        assert model.storyThemeInstance != null
        assert model.storyThemeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/storyTheme/list'

        response.reset()

        populateValidParams(params)
        def storyTheme = new StoryTheme(params)

        assert storyTheme.save() != null
        assert StoryTheme.count() == 1

        params.id = storyTheme.id

        controller.delete()

        assert StoryTheme.count() == 0
        assert StoryTheme.get(storyTheme.id) == null
        assert response.redirectedUrl == '/storyTheme/list'
    }
}
