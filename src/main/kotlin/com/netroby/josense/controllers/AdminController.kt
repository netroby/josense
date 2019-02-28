package com.netroby.josense.controllers

import com.netroby.josense.service.ArticleService
import com.netroby.josense.service.AuthAdapterService
import com.netroby.josense.service.PrepareModelService
import com.netroby.josense.vo.Article
import com.netroby.josense.vo.ArticleAdd
import com.netroby.josense.vo.ArticleEdit
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.*
import org.springframework.web.servlet.ModelAndView

@Controller
class AdminController (
        @Autowired private val articleService: ArticleService,
        @Autowired private val authAdapterService: AuthAdapterService,
        @Autowired private val prepareModelService: PrepareModelService
        ){
    private val logger = LoggerFactory.getLogger("admin")

    @GetMapping("/admin")
    fun home(model: Model, @RequestParam(value = "page", defaultValue = "0") page: Int): ModelAndView {
        val result =  this.articleService.findAll(page)
        model.addAttribute("result", result.content)
        model.addAllAttributes(prepareModelService.getModel())

        model.addAttribute("nextPage", page+1)
        var prevPage = page - 1
        if (prevPage < 0) {
            prevPage = 0
        }
        model.addAttribute("prevPage", prevPage)
        logger.info("result {}", result.content.toString().substring(0..220))
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
    fun add(model: Model): ModelAndView {
        model.addAttribute("username", authAdapterService.getUserName())
        model.addAttribute("isAuthenticated", authAdapterService.isAuthenticated())
        return ModelAndView("admin/add")
    }
    @GetMapping("/admin/edit/{id}")
    fun edit(model: Model, @PathVariable("id") id: Int): ModelAndView {
        val result = this.articleService.findById(id.toLong());
        model.addAttribute("result", result.get())
        model.addAllAttributes(prepareModelService.getModel())
        var resultString = result.toString()
        if (resultString.length > 220) {
            resultString = resultString.substring(0..220)
        }
        logger.info("result {}", resultString)
        return ModelAndView("admin/edit")
    }
    @PostMapping("/admin/save-add")
    fun saveAdd(model: Model, articleAdd: ArticleAdd): ModelAndView {
        val article = Article(title = articleAdd.title, content = articleAdd.content,
                publishStatus = 1 )
        var resultString = article.toString()
        if (resultString.length > 220) {
            resultString = resultString.substring(0..220)
        }
        logger.info("article {}", resultString)
        this.articleService.save(article)
        model.addAttribute("message", "Success")
        model.addAllAttributes(prepareModelService.getModel())
        return ModelAndView("message")
    }
    @PostMapping("/admin/save-edit")
    fun saveEdit(model: Model, articleEdit: ArticleEdit): ModelAndView {
        val article = Article(aid = articleEdit.aid, title = articleEdit.title, content = articleEdit.content)
        this.articleService.save(article)
        model.addAttribute("message", "Success")
        model.addAllAttributes(prepareModelService.getModel())
        return ModelAndView("message")
    }
}