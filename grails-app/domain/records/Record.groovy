package records

/**
 * "Amount","Process Date","Settlement Date","Return/Fail Date","Return/Fail Reason",
 * "ACH/CC","Payment Type","CCType","Discount Amount","Transaction Fee","Deposit Date"
 */
class Record {
	static searchable = [only:['amount','fund','processDate','ccType','checkNumber']]
	
	Person person

	BigDecimal amount
	
	Fund fund
	
	String checkNumber

	String ccType
	
	Integer month
	
	Integer year

	Integer day
	
	Date processDate
	
	void setProcessDate(Date date) {
		this.@processDate = date
		date?.toCalendar()?.with {
			month = get(MONTH)
			year = get(YEAR)
			day = get(DATE)
		}
	}
	
	static belongsTo = Person

    static constraints = {
		amount(min:-1.0e6G,max:1.0e6G,scale:2)
		fund(nullable:false)		
		ccType(blank:true,nullable:true)
		person(nullable:false)
		checkNumber(blank:true,nullable:true)
    }

	String toString() {
		"$amount to ${fund ?: 'General'} on $year-$month-$day"
	}
}
