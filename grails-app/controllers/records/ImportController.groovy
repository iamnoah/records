package records

class ImportController {

	ImportService importService
	
    def index() { 
		[errors:params.list('errors')]
	}
	
	def uploadVanco() {
		ImportResult result = request.getFile('data').inputStream.withReader {
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
