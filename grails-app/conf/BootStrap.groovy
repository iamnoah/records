import records.*

class BootStrap {

    def init = { servletContext ->
		Fund.findOrSaveByVancoIdAndName("1","General Budget")
		Fund.findOrSaveByVancoIdAndName("2","Lead Pastor Support")
		Fund.findOrSaveByVancoIdAndName("3","Local/Global Action Suppor")

		Record.list().each {
			it.processDate = it.processDate
		}
    }

    def destroy = {
    }
}
