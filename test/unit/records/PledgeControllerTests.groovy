package records



import org.junit.*
import grails.test.mixin.*

@TestFor(PledgeController)
@Mock(Pledge)
class PledgeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pledge/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pledgeInstanceList.size() == 0
        assert model.pledgeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.pledgeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pledgeInstance != null
        assert view == '/pledge/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pledge/show/1'
        assert controller.flash.message != null
        assert Pledge.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pledge/list'


        populateValidParams(params)
        def pledge = new Pledge(params)

        assert pledge.save() != null

        params.id = pledge.id

        def model = controller.show()

        assert model.pledgeInstance == pledge
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pledge/list'


        populateValidParams(params)
        def pledge = new Pledge(params)

        assert pledge.save() != null

        params.id = pledge.id

        def model = controller.edit()

        assert model.pledgeInstance == pledge
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pledge/list'

        response.reset()


        populateValidParams(params)
        def pledge = new Pledge(params)

        assert pledge.save() != null

        // test invalid parameters in update
        params.id = pledge.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pledge/edit"
        assert model.pledgeInstance != null

        pledge.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pledge/show/$pledge.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pledge.clearErrors()

        populateValidParams(params)
        params.id = pledge.id
        params.version = -1
        controller.update()

        assert view == "/pledge/edit"
        assert model.pledgeInstance != null
        assert model.pledgeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pledge/list'

        response.reset()

        populateValidParams(params)
        def pledge = new Pledge(params)

        assert pledge.save() != null
        assert Pledge.count() == 1

        params.id = pledge.id

        controller.delete()

        assert Pledge.count() == 0
        assert Pledge.get(pledge.id) == null
        assert response.redirectedUrl == '/pledge/list'
    }
}
