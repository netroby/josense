package com.netroby.josense.event.listener

import com.netroby.josense.event.ViewArticleEvent
import com.netroby.josense.repository.ArticleRepository
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.event.EventListener
import org.springframework.scheduling.annotation.Async
import org.springframework.stereotype.Component

@Component
class ViewArticleEventListener  (
        @Autowired private val articleRepository: ArticleRepository
) {

    private val logger = LoggerFactory.getLogger("ViewArticleEventListener")
    @Async
    @EventListener
    @Override
    fun handleViewArticle(v: ViewArticleEvent) {
        logger.info("handlerViewArticle: {}", v)
        v.article.views = v.article.views + 1
        articleRepository.save(v.article)
    }
}