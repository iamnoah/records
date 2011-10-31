package records

class ImportResult {

	/**
	 * New records.
	 */
	List<Record> records = []
	
	/**
	 * People created for the new records.
	 */
	List<Person> people = []
	
	void saveAll() {
		people*.save()
		records*.save()
	}
	
}
