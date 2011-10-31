package records

import groovy.transform.EqualsAndHashCode;
/**
 * "Fund ID","Fund Name"
 */
@EqualsAndHashCode
class Fund {
	
	String vancoId
	
	String name
	
	static constraints = {
		vancoId(blank:true,display:false,unique:true)
	}
}
