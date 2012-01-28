package records

/**
 * Represents an amount a person has pledged to give for a certain period.
 */
class Pledge {

	Person person

	Fund fund

	// whole dollars
	int amount

	int startYear

	int startMonth

	int endYear

	int endMonth

	Date getStart() {
		Calendar.instance.with {
			clearTime()
			set(DAY_OF_MONTH,1)
			set(MONTH,startMonth)
			set(YEAR,startYear)
			time
		}
	}

	void setStart(Date date) {
		date?.toCalendar()?.with {
			startYear = it[YEAR]
			startMonth = it[MONTH]
		}
	}

	Date getEnd() {
		Calendar.instance.with {
			clearTime()
			set(DAY_OF_MONTH,1)
			set(MONTH,endMonth)
			set(YEAR,endYear)
			// get the last milisecond of the month
			add(MONTH,1)
			add(MILLISECOND,-1)
			time
		}
	}

	void setEnd(Date date) {
		date?.toCalendar()?.with {
			endYear = it[YEAR]
			endMonth = it[MONTH]
		}
	}

	static transients = ['start','end']

    static constraints = {
    	amount(min:1)
    }

    String toString() {
    	"\$$amount from $person to $fund from $startMonth/$startYear to $endMonth/$endYear"
    }

}
