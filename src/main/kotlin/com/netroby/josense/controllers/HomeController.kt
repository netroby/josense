package com.netroby.josense.controllers

import com.alibaba.fastjson.JSON
import com.netroby.josense.repository.ArticleRepository
import com.netroby.josense.service.AuthAdapterService
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.ModelAndView
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
class HomeController (
        @Autowired private val articleRepository: ArticleRepository,
        @Autowired private val authAdapterService: AuthAdapterService
){
    private val logger = LoggerFactory.getLogger("home")
    @GetMapping("/")
    fun home(model: Model, @RequestParam(value = "page", defaultValue = "0") page: Int): ModelAndView {
        val sort = Sort(Sort.Direction.DESC, "aid")
        val pageable = PageRequest.of(page, 15, sort)
        val result =  articleRepository.findAll(pageable)
        model.addAttribute("result", result.content)
        val role = SimpleGrantedAuthority("ROLE_ADMIN");
        logger.info("auth info {}", JSON.toJSON(authAdapterService.getAuthentication()?.authorities))
        logger.info("{}", authAdapterService.getAuthentication()?.authorities?.contains(role))
        model.addAttribute("username", authAdapterService.getUserName())
        model.addAttribute("isAuthenticated", authAdapterService.isAuthenticated())
        logger.info("Hello world")
        logger.info("result {}", result.content)
        return ModelAndView("home")
    }
    @GetMapping("/view/{id}")
    fun view(model: Model, @PathVariable("id") id: Int): ModelAndView {
        val result = articleRepository.findById(id.toLong());
        model.addAttribute("result", result.get())
        model.addAttribute("username", authAdapterService.getUserName())
        model.addAttribute("isAuthenticated", authAdapterService.isAuthenticated())
        logger.info("result {}", result)
        return ModelAndView("view")
    }
    @RequestMapping("/login")
    fun login(): String {
        return "login"
    }
    @RequestMapping("/logout")
    fun logout(request: HttpServletRequest, response: HttpServletResponse): String {
        var auth = authAdapterService.getAuthentication()
        if (auth != null) {
            SecurityContextLogoutHandler().logout(request, response, auth)
        }
        return "redirect:/"
    }
}