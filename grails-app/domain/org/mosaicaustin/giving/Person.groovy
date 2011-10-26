package org.mosaicaustin.giving

/**
 * "Member ID","Member Name"
 */
class Person {

	String vancoId
	
	String name

	Set<Address> addresses
	
	List<Record> records
	
	String notes
	
	static hasMany = [addresses:Address,records:Record]

    static constraints = {
		vancoId(blank:true,display:false)
		notes(blank:true,widget:'textArea')
    }
}
