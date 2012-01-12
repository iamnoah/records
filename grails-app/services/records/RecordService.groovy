package records

class RecordService {
	
	static transactional = true
	
	void move(Person from, Person to) {
		def copy = new LinkedHashSet(from.records)
		from.records.clear()
		copy.each to.&addToRecords
		
		from.save()
		to.save()
	}
}