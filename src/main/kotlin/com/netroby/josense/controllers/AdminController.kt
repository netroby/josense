package com.netroby.josense.controllers

import com.netroby.josense.repository.ArticleRepository
import com.netroby.josense.service.AuthAdapterService
import com.netroby.josense.service.PrepareModelService
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

@Controller
class AdminController (
        @Autowired private val articleRepository: ArticleRepository,
        @Autowired private val authAdapterService: AuthAdapterService,
        @Autowired private val prepareModelService: PrepareModelService
        ){
    private val logger = LoggerFactory.getLogger("admin")

    @GetMapping("/admin")
    fun home(model: Model, @RequestParam(value = "page", defaultValue = "0") page: Int): ModelAndView {
        val sort = Sort(Sort.Direction.DESC, "aid")
        val pageable = PageRequest.of(page, 15, sort)
        val result =  articleRepository.findAll(pageable)
        model.addAttribute("result", result.content)
        model.addAllAttributes(prepareModelService.getModel())

        model.addAttribute("nextPage", page+1)
        var prevPage = page - 1;
        if (prevPage < 0) {
            prevPage = 0;
        }
        model.addAttribute("prevPage", prevPage)
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
    fun add(model: Model): ModelAndView {
        model.addAttribute("username", authAdapterService.getUserName())
        model.addAttribute("isAuthenticated", authAdapterService.isAuthenticated())
        return ModelAndView("admin/add")
    }
    @GetMapping("/admin/edit/{id}")
    fun edit(model: Model, @PathVariable("id") id: Int): ModelAndView {
        val result = articleRepository.findById(id.toLong());
        model.addAttribute("result", result.get())
        model.addAllAttributes(prepareModelService.getModel())
        logger.info("result {}", result)
        return ModelAndView("admin/edit")
    }
    @PostMapping("/admin/save-add")
    fun saveAdd(model: Model, articleAdd: ArticleAdd): ModelAndView {
        val article = Article(title = articleAdd.title, content = articleAdd.content,
                publishStatus = 1 )
        logger.info("article {}", article)
        this.articleRepository.save(article)
        model.addAttribute("message", "Success")
        model.addAllAttributes(prepareModelService.getModel())
        return ModelAndView("message")
    }
    @PostMapping("/admin/save-edit")
    fun saveEdit(model: Model, articleEdit: ArticleEdit): ModelAndView {
        val article = Article(aid = articleEdit.aid, title = articleEdit.title, content = articleEdit.content)
        this.articleRepository.save(article)
        model.addAttribute("message", "Success")
        model.addAllAttributes(prepareModelService.getModel())
        return ModelAndView("message")
    }
}