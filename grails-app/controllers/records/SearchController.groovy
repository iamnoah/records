package records

import org.compass.core.engine.SearchEngineQueryParseException

class SearchController {

    def searchableService

    /**
     * Index page with search form and results
     */
    def index() {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            return [searchResult: searchableService.search(params.q, params)]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }
}