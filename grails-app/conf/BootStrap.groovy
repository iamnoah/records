import records.*

class BootStrap {

    def init = { servletContext ->
		Fund.findOrSaveByVancoIdAndName("0001","General Budget")
		Fund.findOrSaveByVancoIdAndName("0002","Lead Pastor Support")
		Fund.findOrSaveByVancoIdAndName("0003","Local/Global Action Suppor")

		Record.list().each {
			it.processDate = it.processDate
		}
    }

    def destroy = {
    }
}
