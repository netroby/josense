package com.netroby.josense.controllers

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
open class HomeController {
    @GetMapping("/")
    fun home(): String {
        return "home"
    }
    @GetMapping("/view")
    fun view(): String {
        return "home"
    }
}