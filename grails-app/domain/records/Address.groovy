package records

/**
 * "Address1","Address2","City","State","Zip","Phone","Email",
 */
class Address {
	
	Person person
	
	String line1
	
	String line2
	
	String city
	
	String state
	
	String zip
	
	String phone
	
	String email
	
	static belongsTo = Person

    static constraints = {
		line2(blank:true,nullable:true)
		phone(blank:true)
		email(email:true,blank:true)
    }
}
