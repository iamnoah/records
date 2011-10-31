import records.*

class BootStrap {

    def init = { servletContext ->
		Fund.findOrSaveByVancoIdAndName("0001","General Budget")
		Fund.findOrSaveByVancoIdAndName("0002","Community/ContemplationSupport")
		Fund.findOrSaveByVancoIdAndName("0003","Local/Global Action Support")
    }

    def destroy = {
    }
}
