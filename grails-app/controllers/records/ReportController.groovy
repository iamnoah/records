package records

class ReportController {

    def index() {
		def year = params.year?.toInteger() ?: (new Date().year - 1)

		if(params.people) {
			return [people: Person.executeQuery('select distinct p from Person p inner join p.records as r where r.year = :year and p.id in (:ids)',[
				year: year,
				ids: params.list('people')*.toLong()
			]),year: year]
		}

		[people: Person.executeQuery('select distinct p from Person p inner join p.records as r where r.year = :year',[
			year: year
		]),year: year]
	}

	def csv() {
		response.setContentType('text/plain')
		index()
	}
}
