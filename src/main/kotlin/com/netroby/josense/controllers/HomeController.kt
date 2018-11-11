package com.netroby.josense.controllers

import com.netroby.josense.repository.ArticleRepository
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.ModelAndView

@Controller
class HomeController (@Autowired private val articleRepository: ArticleRepository){
    private val logger = LoggerFactory.getLogger("home")
    @GetMapping("/")
    fun home(model: Model, @RequestParam(value = "page", defaultValue = "0") page: Int): ModelAndView {
        val sort = Sort(Sort.Direction.DESC, "aid")
        val pageable = PageRequest.of(page, 15, sort)
        val result =  articleRepository.findAll(pageable)
        model.addAttribute("result", result.content)
        logger.info("Hello world")
        logger.info("result {}", result.content)
        return ModelAndView("home")
    }
    @GetMapping("/view/{id}")
    fun view(model: Model, @PathVariable("id") id: Int): ModelAndView {
        val result = articleRepository.findById(id.toLong());
        model.addAttribute("result", result.get())
        logger.info("result {}", result)
        return ModelAndView("view")
    }
    @GetMapping("/login")
    fun login(model: Model): ModelAndView {
        return ModelAndView("login")
    }
    @GetMapping("/logout")
    fun logout(model: Model): ModelAndView {
        return ModelAndView("logout")
    }
}