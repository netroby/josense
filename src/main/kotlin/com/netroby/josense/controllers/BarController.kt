package com.netroby.josense.controllers


import com.netroby.josense.config.JosenseConfig
import com.netroby.josense.event.ViewArticleEvent
import com.netroby.josense.repository.ArticleRepository
import com.netroby.josense.service.ArticleService
import com.netroby.josense.service.AuthAdapterService
import com.netroby.josense.service.PrepareModelService
import com.netroby.josense.vo.Article
import com.rometools.rome.feed.synd.SyndContentImpl
import com.rometools.rome.feed.synd.SyndEntry
import com.rometools.rome.feed.synd.SyndEntryImpl
import com.rometools.rome.feed.synd.SyndFeedImpl
import com.rometools.rome.io.SyndFeedOutput
import freemarker.template.Configuration
import org.jsoup.Jsoup
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.ApplicationEventPublisher
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.http.HttpStatus
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils
import org.springframework.web.bind.annotation.*
import org.springframework.web.server.ResponseStatusException
import org.springframework.web.servlet.ModelAndView
import java.util.*
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse


@RestController
class BarController(
        @Autowired private val freeMarkerConfig: Configuration
) {
    private val logger = LoggerFactory.getLogger("home")
    @GetMapping(value = ["/bar/{progress}"], produces = ["image/svg+xml"])
    fun home(@PathVariable(name = "progress", required = false) progress: Double): String {
        var iProgress  = 0.0
        if (progress == null) {
            iProgress = 0.0
        } else {
            iProgress = progress
        }
        val scale = 100.0
        val titleWidth = 0.0
        val progressWidth = 90.0
        val totalWidth = titleWidth + progressWidth
        val scaleRatio = iProgress / scale
        val width = progressWidth * iProgress / scale
        val progressX = titleWidth + progressWidth / 2
        var color = "#5cb85c"
        if (scaleRatio < 0.3) {
            color = "#d9534f"
        }
        if (scaleRatio >= 0.3 && scaleRatio < 0.7) {
            color = "#f0ad4e"
        }
        val data = HashMap<String, Any>()
        data["scale"] = scale
        data["titleWidth"] = titleWidth
        data["progressWidth"] = progressWidth
        data["totalWidth"] = totalWidth
        data["scaleRatio"] = scaleRatio
        data["suffix"] = "%"
        data["progress"] = iProgress
        data["color"] = color
        data["progressX"] = progressX
        data["width"] = width
        var outStr: String = ""
        try {
            val t = freeMarkerConfig.getTemplate("bar.ftl")

            outStr = FreeMarkerTemplateUtils.processTemplateIntoString(t, data)
            logger.info(outStr)
        } catch (e: Exception) {
            logger.error("Unable got template render", e)
        }

        return outStr
    }

}