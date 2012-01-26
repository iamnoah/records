package records

class ReportController {

    def index() {
		def year = params.year?.toLong() ?: 2011
		
		if(params.people) {
			return [people: Person.executeQuery('select distinct p from Person p inner join p.records as r where r.processDate >= :start and r.processDate < :end and p.id in (:ids)',[
				start: new Date("$year/01/01"),
				end: new Date("${year+1}/01/01"),
				ids: params.list('people')*.toLong()
			])]
		}
	
		[people: Person.executeQuery('select distinct p from Person p inner join p.records as r where r.processDate >= :start and r.processDate < :end',[
			start: new Date("$year/01/01"),
			end: new Date("${year+1}/01/01")
		])]
	}
}
