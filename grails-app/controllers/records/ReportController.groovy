package records

class ReportController {

    def index() {
		[people: Person.executeQuery('select distinct p from Person p inner join p.records as r where r.processDate >= :start and r.processDate < :end',[
			start: new Date('2011/01/01'),
			end: new Date('2012/01/01')
		])]
	}
}
