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
		phone(blank:true,nullable:true)
		email(email:true,blank:true,nullable:true)
    }

	String toAddressString() {
		def lines = line1
		if(line2) lines += '\n' + line2
		
"""$lines
$city, $state  $zip"""
	}
	
	String toString() {
"""\
${toAddressString()}
$phone
$email
"""
	}
}
