package records

class ImportController {

	ImportService importService
	
    def index() { 
		[errors:params.list('errors')]
	}
	
	def uploadVanco() {
		def data = params.dataString
		if(data) {
			data = new StringReader(data)
		} else {
			data = request.getFile('data').inputStream
		}
		ImportResult result = data.withReader {
			importService.importVanco it
		}
		if(result.errors) {
			redirect(action:'index',params:[errors:result.errors])
		} else {
			result.saveAll()
			if(result.records*.hasErrors().any() ||
					result.people*.hasErrors().any()) {
				return result.properties
			}	
			redirect(controller:'record',action:'list',
					params:[ids:result.records*.id])
		}
	}
}
