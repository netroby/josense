package com.netroby.josense.controllers


import org.springframework.boot.web.servlet.error.ErrorController
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.servlet.ModelAndView
import javax.servlet.http.HttpServletRequest

@Controller
class HandleErrorController  : ErrorController {
    @GetMapping("/error")
    fun home(model: Model, req: HttpServletRequest): ModelAndView {
        val e = req.getAttribute("javax.servlet.error.exception") as Exception
        model.addAttribute("message", e.message)
        return ModelAndView("message")
    }

    override fun getErrorPath(): String {
        return "/error"
    }
}