package com.netroby.josense.service.impl

import com.netroby.josense.repository.ArticleRepository
import com.netroby.josense.service.ArticleService
import com.netroby.josense.vo.Article
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.cache.annotation.CacheEvict
import org.springframework.cache.annotation.Cacheable
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Component
import java.util.*

@Component
class ArticleServiceImpl (
        @Autowired private val articleRepository: ArticleRepository
) : ArticleService {

    private val logger = LoggerFactory.getLogger("ArticleServiceImpl")

    @Cacheable("gkcache")
    override fun findAll(page: Int): Page<Article> {

        val sort = Sort(Sort.Direction.DESC, "aid")
        val pageable = PageRequest.of(page, 15, sort)
        return articleRepository.findAll(pageable)
    }

    @Cacheable("gkcache")
    override fun findByContentContainingOrTitleContaining(page: Int, key: String): Page<List<Article>> {

        val sort = Sort(Sort.Direction.DESC, "aid")
        val pageable = PageRequest.of(page, 15, sort)
        logger.info("Search by keyword {}", key)
        return articleRepository.findByContentContainingOrTitleContaining(pageable, "%$key%", "%$key%")
    }
    @Cacheable("gbcache")
    override fun findById(id: Long): Optional<Article> {
        return articleRepository.findById(id)
    }
    @CacheEvict(value=["gbcache", "gkcache"], allEntries = true)
    override fun save(article: Article): Article{
        return articleRepository.save(article)
    }
}