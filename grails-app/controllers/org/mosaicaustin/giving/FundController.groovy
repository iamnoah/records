package org.mosaicaustin.giving

import org.springframework.dao.DataIntegrityViolationException

class FundController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fundInstanceList: Fund.list(params), fundInstanceTotal: Fund.count()]
    }

    def create() {
        [fundInstance: new Fund(params)]
    }

    def save() {
        def fundInstance = new Fund(params)
        if (!fundInstance.save(flush: true)) {
            render(view: "create", model: [fundInstance: fundInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'fund.label', default: 'Fund'), fundInstance.id])
        redirect(action: "show", id: fundInstance.id)
    }

    def show() {
        def fundInstance = Fund.get(params.id)
        if (!fundInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])
            redirect(action: "list")
            return
        }

        [fundInstance: fundInstance]
    }

    def edit() {
        def fundInstance = Fund.get(params.id)
        if (!fundInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])
            redirect(action: "list")
            return
        }

        [fundInstance: fundInstance]
    }

    def update() {
        def fundInstance = Fund.get(params.id)
        if (!fundInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (fundInstance.version > version) {
                fundInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fund.label', default: 'Fund')] as Object[],
                          "Another user has updated this Fund while you were editing")
                render(view: "edit", model: [fundInstance: fundInstance])
                return
            }
        }

        fundInstance.properties = params

        if (!fundInstance.save(flush: true)) {
            render(view: "edit", model: [fundInstance: fundInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'fund.label', default: 'Fund'), fundInstance.id])
        redirect(action: "show", id: fundInstance.id)
    }

    def delete() {
        def fundInstance = Fund.get(params.id)
        if (!fundInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])
            redirect(action: "list")
            return
        }

        try {
            fundInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fund.label', default: 'Fund'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
