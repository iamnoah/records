@Grab(group='net.sf.opencsv', module='opencsv', version='2.0')
import au.com.bytecode.opencsv.CSVReader
import au.com.bytecode.opencsv.CSVWriter

// println '<pre>'

def date = new java.text.SimpleDateFormat('MM/dd/yy')

System.in.withReader {
  System.out.withWriter { write ->
	
	def (header, records) = new CSVReader(it).readAll().findAll { it.findAll().size() }.with { [it.head(),it.tail()] }

	def addr = null
	def out = new CSVWriter(write)
	def headers = ["Client ID","Member ID","Member Name","Address1","Address2","City","State","Zip","Phone","Email","Fund ID","Fund Name","Amount","Process Date","Settlement Date","Return/Fail Date","Return/Fail Reason","ACH/CC","Payment Type","CCType","Discount Amount","Transaction Fee","Deposit Date","CheckNo","Notes"]
	def set = { line, name, value ->
		def index = headers.indexOf(name)
		if(index >= 0) {
			line[index] = value			
		}
	}
	def ids = -1
	out.writeNext(headers as String[])
	records.groupBy {
		if(it[0]) {
			addr = it[0]
		}
		addr
	}.each { address, recs ->
		// first line is the name
		def name = address.split('\n').head().split(' ').reverse().with { 
			[head(),tail().reverse().join(' ')].join(', ')
		}
		def line = headers.collect {''}
		set(line,'Member Name',name)
		address.split('\n').tail().reverse().with {
			if(!it) return
			
			// parse the last line
			head().replaceAll(/^(.*?), (.*?) ([\d-]+)$/) { l, city, state, zip ->
				set(line,'City',city)
				set(line,'State',state)
				set(line,'Zip',zip)
			}
			
			// remaining lines are address
			tail().reverse().eachWithIndex { addressLine, i ->
				set(line,"Address${i+1}".toString(),addressLine)
			}
		}
		
		// fake an id
		set(line,'Member ID',ids--)		
		
		recs.each { r ->
			def lineCopy = line.clone()

			set(lineCopy,'Process Date',date.parse(r[1]).format('yyyy-MM-dd'))
			set(lineCopy,'Amount',r[2].replaceAll(',',''))
			if(r.size() == 4) {
				set(lineCopy,'CheckNo',r[3])
			}
			
			if(r.size() == 5) {
				// retreat doesn't count
				if(r[4] =~ /(?i)retreat/) return
				set(lineCopy,'Notes','Recorded Fund: '+r[4])
				set(lineCopy,'Fund ID',r[4] =~ /(?i)action/ ? '0003' : r[4] =~ /(?i)com/ ? '0002' : '0001')				
			} else {
				set(lineCopy,'Fund ID','0001');
			}		

			out.writeNext(lineCopy as String[])			
		}
	}
  }
}
