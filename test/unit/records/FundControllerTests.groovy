package records



import org.junit.*
import records.FundController;

import grails.test.mixin.*
import javax.servlet.http.HttpServletResponse

@TestFor(FundController)
@Mock(Fund)
class FundControllerTests {

    void testIndex() {
        controller.index()
        assert "/fund/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fundInstanceList.size() == 0
        assert model.fundInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.fundInstance != null
    }

    void testSave() {
        controller.save()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.save()

        assert model.fundInstance != null
        assert view == '/fund/create'

        response.reset()

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/fund/show/1'
        assert controller.flash.message != null
        assert Fund.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fund/list'


        def fund = new Fund()

        // TODO: populate domain properties

        assert fund.save() != null

        params.id = fund.id

        def model = controller.show()

        assert model.fundInstance == fund
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fund/list'


        def fund = new Fund()

        // TODO: populate valid domain properties

        assert fund.save() != null

        params.id = fund.id

        def model = controller.edit()

        assert model.fundInstance == fund
    }

    void testUpdate() {

        controller.update()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fund/list'

        response.reset()


        def fund = new Fund()

        // TODO: populate valid domain properties

        assert fund.save() != null

        // test invalid parameters in update
        params.id = fund.id

        controller.update()

        assert view == "/fund/edit"
        assert model.fundInstance != null

        fund.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/fund/show/$fund.id"
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert response.status == HttpServletResponse.SC_METHOD_NOT_ALLOWED

        response.reset()
        request.method = 'POST'
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fund/list'

        response.reset()

        def fund = new Fund()

        // TODO: populate valid domain properties
        assert fund.save() != null
        assert Fund.count() == 1

        params.id = fund.id

        controller.delete()

        assert Fund.count() == 0
        assert Fund.get(fund.id) == null
        assert response.redirectedUrl == '/fund/list'
    }
}
