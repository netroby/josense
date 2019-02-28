package com.netroby.josense.service

import com.netroby.josense.vo.Article
import org.springframework.data.domain.Page
import java.util.*

interface ArticleService {
    fun findAll(page: Int) : Page<Article>
    fun findById(id: Long) : Optional<Article>
    fun findByContentContainingOrTitleContaining(page: Int, key : String): Page<List<Article>>
    fun save(article: Article): Article
}