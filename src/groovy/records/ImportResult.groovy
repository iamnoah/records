package records

class ImportResult {

	List<String> errors = []
	
	/**
	 * New records.
	 */
	List<Record> records = []
	
	/**
	 * People created for the new records.
	 */
	List<Person> people = []
	
	void saveAll() {
		people*.save(flush:true)
		records.findAll {
			it.person.id
		}*.save(flush:true)
	}
	
}
