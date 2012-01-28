package records

import groovy.transform.EqualsAndHashCode;
/**
 * "Fund ID","Fund Name"
 */
@EqualsAndHashCode
class Fund {

	String vancoId

	String name

	List<Pledge> getPledgesForYear(year=null) {
		if(year == null) {
			year = Calendar.instance[Calendar.YEAR]
		}
		Pledge.findAllByFundAndStartYearLessThanEqualsAndEndYearGreaterThanEquals(this,year,year)
	}


	List<Record> getRecordsForYear(year=null) {
		if(year == null) {
			year = Calendar.instance[Calendar.YEAR]
		}
		Record.createCriteria().call {
			eq('fund',this)
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
			eq('fund',this)
			eq('month',month as int)
			eq('year',year as int)
			order('day')
		}
	}

	static transients = ['pledgesForYear','recordsForMonth','recordsForYear']

	static constraints = {
		vancoId(blank:true,display:false,unique:true)
	}

	String toString() {
		"$vancoId - $name"
	}
}
