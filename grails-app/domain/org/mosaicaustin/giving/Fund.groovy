package org.mosaicaustin.giving

/**
 * "Fund ID","Fund Name"
 */
class Fund {
	
	String vancoId
	
	String name

	static constraints = {
		vancoId(blank:true,display:false)
	}
}
