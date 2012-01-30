package records

/**
 * "Member ID","Member Name"
 */
class Person {
	static searchable = [only:['vancoId','name','addresses','notes']]

	String vancoId

	String name

	Set<Address> addresses = [] as Set

	List<Record> records = []

	String notes

	String getFirstName() {
		name.split(', ').last()
	}

	String getLastName() {
		name.split(', ').first()
	}

	List<Record> getRecordsForYear(year=null) {
		if(year == null) {
			year = Calendar.instance[Calendar.YEAR]
		}
		Record.createCriteria().call {
			eq('person',this)
			eq('year',year as int)
			order('month')
			order('day')
		}
	}

	List<Record> getRecordsForMonth(month=null,year=null) {
		if(month == null) {
			month = Calendar.instance[Calendar.MONTH]
		}
		if(year == null) {
			year = Calendar.instance[Calendar.YEAR]
		}
		Record.createCriteria().call {
			eq('person',this)
			eq('year',year as int)
			eq('month',month as int)
			order('day')
		}
	}

	List<Pledge> getPledgesForYear(year=null) {
		if(year == null) {
			year = Calendar.instance[Calendar.YEAR]
		}
		Pledge.findAllByPersonAndStartYearLessThanEqualsAndEndYearGreaterThanEquals(this,year,year)
	}

	static transients = ['firstName','lastName','recordsForYear','recordsForMonth','pledgesForYear']

	static hasMany = [addresses:Address,records:Record]

    static constraints = {
		vancoId(blank:true,nullable:true,display:false,unique:true)
		notes(blank:true,nullable:true,widget:'textArea')
		name(validator: {
			it.indexOf(', ') > 0 ? true : 'lastFirst'
		})
    }

	String toString() { name }
}
