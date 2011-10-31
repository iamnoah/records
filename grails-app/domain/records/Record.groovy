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
	
	Date processDate
	
	static belongsTo = Person

    static constraints = {
		amount(min:0.0G,max:1.0e6G,scale:2)
		fund(nullable:false)		
		ccType(blank:true)
		person(nullable:false)
		checkNumber(blank:true)
    }
}
