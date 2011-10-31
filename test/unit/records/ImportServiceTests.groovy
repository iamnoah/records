package records

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(ImportService)
@Mock([Fund,Record,Person,Address])
class ImportServiceTests {

	@Test
    void testImportVanco() {
		
        def data = new ImportService().importVanco(new StringReader('''
"Client ID","Member ID","Member Name","Address1","Address2","City","State","Zip","Phone","Email","Fund ID","Fund Name","Amount","Process Date","Settlement Date","Return/Fail Date","Return/Fail Reason","ACH/CC","Payment Type","CCType","Discount Amount","Transaction Fee","Deposit Date"
"ES11040","6628851","BLOW, JOE","123 FAKE ST","","AUSTIN","TX","78757","5123717648","JOE@BLOW.COM","0001","General Budget","50.0","2011-09-29","2011-10-03","","","ACH","WEB","","0.0","0.0","2011-10-03"
"ES11040","6646013","DOE, JANE","402 EVERGREEN TER","","SPRINGFIELD","TX","78722","5122994231","JANE@DEER.COM","0001","General Budget","402.0","2011-09-29","2011-10-03","","","ACH","WEB","","0.0","0.0","2011-10-03"
"ES11040","6646013","DOE, JANE","402 EVERGREEN TER","","SPRINGFIELD","TX","78722","5122994231","JANE@DEER.COM","0003","Local/Global Action Support","225.0","2011-09-29","2011-10-03","","","ACH","WEB","","0.0","0.0","2011-10-03"
'''))

		assert 2 == data.people.size()
		assert 3 == data.records.size()
		assert 2 == data.people*.addresses.flatten().
			unique().size()
		
		assert data.records[1].fund.vancoId == '0001'
    }
}
