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
	
	static transients = ['firstName','lastName']
		
	static hasMany = [addresses:Address,records:Record]

    static constraints = {
		vancoId(blank:true,nullable:true,display:false,unique:true)
		notes(blank:true,nullable:true,widget:'textArea')
		name(validator: {
			it.indexOf(', ') > 0 ? true : 'Enter Last Name, First Name'
		})
    }
	
	String toString() { name }
}
