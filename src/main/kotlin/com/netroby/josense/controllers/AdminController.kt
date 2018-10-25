package com.netroby.josense.controllers

import com.netroby.josense.repository.ArticleRepository
import com.netroby.josense.vo.Article
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort


@Controller
open class AdminController (@Autowired private val articleRepository: ArticleRepository){
    @GetMapping("/admin")
    fun home(@RequestParam(value = "page") page: Int): Page<Article> {
        val sort = Sort(Sort.Direction.DESC, "aid")
        val pageable = PageRequest.of(page, 15, sort)
        return articleRepository.findAll(pageable)
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