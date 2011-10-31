package records

import au.com.bytecode.opencsv.CSVReader

class ImportService {

    ImportResult importVanco(Reader text) {
		def lines = new CSVReader(text)
		
		int i = 0;
		def mapping = [:] + next(lines)?.collectEntries { name ->
			[name,i++]
		}
		def people = [], peopleById = [:], records = []
		
		String[] line
		while((line = next(lines))) {
			def vancoId = line[mapping['Member ID']]
			// lookup the person, (also check created people) or create them
			def person = peopleById[vancoId] ?: Person.findOrCreateByVancoId(vancoId)
			person.name = line[mapping['Member Name']]
			if(!people.find { it.vancoId == vancoId }) {
				people << person
			}
			peopleById[vancoId] = person
			
			// try to find a matching address, else create it
			def addrData = [
				line1: line[mapping['Address1']],
				line2: line[mapping['Address2']],
				city: line[mapping['City']],
				state: line[mapping['State']],
				zip: line[mapping['Zip']],
				phone: line[mapping['Phone']],
				email: line[mapping['Email']],
			]
			def address = person.addresses.find {
				addrData.every { k, v -> (it[k] ?: '') == (v ?: '') }
			}
			if(!address) {
				person.addToAddresses(new Address(addrData))
			}
			
			// determine the Fund
			def fund = Fund.findOrCreateByVancoId(line[mapping['Fund ID']])
			if(!fund.name) {
				fund.name = line[mapping['Fund Name']]
				fund.save()
			}
			
			// check for a matching record
			def record = Record.findOrCreateWhere(
				amount: line[mapping['Amount']] as BigDecimal,
				processDate: Date.parse('yyyy-mm-dd',line[mapping['Process Date']]),
				person: person,
				ccType: line[mapping['CCType']],
				fund: fund,
			)
			
			if(!record.id) {
				records << record
			}
		}
		
		[people:people,records:records] as ImportResult
    }
	
	// returns the next truthy line
	private next(lines) {
		def line = lines.readNext()
		line  == null ? null : 
			(line?.findAll()?.size() ? line : next(lines))
	}
}