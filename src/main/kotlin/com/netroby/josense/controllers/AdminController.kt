package com.netroby.josense.controllers

import com.netroby.josense.repository.ArticleRepository
import com.netroby.josense.vo.Article
import com.netroby.josense.vo.ArticleAdd
import com.netroby.josense.vo.ArticleEdit
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.*
import org.springframework.web.servlet.ModelAndView
import java.time.Instant

@Controller
class AdminController (@Autowired private val articleRepository: ArticleRepository){
    private val logger = LoggerFactory.getLogger("admin")
    @GetMapping("/admin")
    fun home(model: Model, @RequestParam(value = "page", defaultValue = "0") page: Int): ModelAndView {
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
    @GetMapping("/admin/edit/{id}")
    fun edit(model: Model, @PathVariable("id") id: Int): ModelAndView {
        val result = articleRepository.findById(id.toLong());
        model.addAttribute("result", result.get())
        logger.info("result {}", result)
        return ModelAndView("admin/edit")
    }
    @PostMapping("/admin/save-add")
    fun saveAdd(model: Model, articleAdd: ArticleAdd): ModelAndView {
        val tm = Instant.now().epochSecond
        val article = Article(title = articleAdd.title, content = articleAdd.content,
                publishStatus = 1, publishTime = tm )
        logger.info("article {}", article)
        this.articleRepository.save(article)
        model.addAttribute("message", "Success")
        return ModelAndView("message")
    }
    @PostMapping("/admin/save-edit")
    fun saveEdit(model: Model, articleEdit: ArticleEdit): ModelAndView {
        val article = Article(aid = articleEdit.aid, title = articleEdit.title, content = articleEdit.content,
                publishStatus = 1)
        this.articleRepository.save(article)
        model.addAttribute("message", "Success")
        return ModelAndView("message")
    }
}