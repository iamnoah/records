package records

/**
 * "Amount","Process Date","Settlement Date","Return/Fail Date","Return/Fail Reason",
 * "ACH/CC","Payment Type","CCType","Discount Amount","Transaction Fee","Deposit Date"
 */
class Record {
	
	Person person

	BigDecimal amount
	
	Fund fund
	
	String checkNumber

	String ccType
	
	Integer month
	
	Integer year
	
	Date processDate
	
	void setProcessDate(Date date) {
		this.@processDate = date
		month = date.month
		year = date.year
	}
	
	static belongsTo = Person

    static constraints = {
		amount(min:0.0G,max:1.0e6G,scale:2)
		fund(nullable:false)		
		ccType(blank:true,nullable:true)
		person(nullable:false)
		checkNumber(blank:true,nullable:true)
    }

	String toString() {
		"$amount > $fund on $processDate"
	}
}
