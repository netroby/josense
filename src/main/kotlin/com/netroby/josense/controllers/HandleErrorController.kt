package com.netroby.josense.controllers


import org.slf4j.LoggerFactory
import org.springframework.boot.web.servlet.error.ErrorController
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.servlet.ModelAndView

@Controller
class HandleErrorController  : ErrorController {
    private val logger = LoggerFactory.getLogger("home")
    @GetMapping("/error")
    fun home(): ModelAndView {
        return ModelAndView("message")
    }

    override fun getErrorPath(): String {
        return "/error"
    }
}