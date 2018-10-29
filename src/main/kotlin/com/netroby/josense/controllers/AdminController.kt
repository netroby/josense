package com.netroby.josense.controllers

import com.alibaba.fastjson.JSON
import com.netroby.josense.repository.ArticleRepository
import com.netroby.josense.vo.Article
import lombok.extern.log4j.Log4j
import lombok.extern.slf4j.Slf4j
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.ui.Model
import org.springframework.web.servlet.ModelAndView


@Controller
open class AdminController (@Autowired private val articleRepository: ArticleRepository){
    private val logger = LoggerFactory.getLogger("admin")
    @GetMapping("/admin")
    fun home(model: Model, @RequestParam(value = "page") page: Int): ModelAndView {
        val sort = Sort(Sort.Direction.DESC, "aid")
        val pageable = PageRequest.of(page, 15, sort)
        val result =  articleRepository.findAll(pageable)
        model.addAttribute("result", result.content)
        logger.info("Hello world")
        logger.info("result {}", result.content)
        return ModelAndView("admin/home")
    }
    @GetMapping("/admin/list")
    fun list(): String {
        return "admin/list"
    }
    @GetMapping("/admin/files")
    fun files(): String {
        return "admin/files"
    }
    @GetMapping("/admin/add")
    fun add(): String {
        return "admin/add"
    }
}