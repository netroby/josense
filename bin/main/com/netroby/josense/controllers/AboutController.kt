package com.netroby.josense.controllers

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
open class AboutController {
    @GetMapping("/about")
    fun home(): String {
        return "about"
    }
}