package com.netroby.josense.repository


import com.netroby.josense.vo.Article
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.repository.PagingAndSortingRepository

interface ArticleRepository : PagingAndSortingRepository<Article, Long> {
    fun  findByContentContainingOrTitleContaining(pageable: Pageable, keyword: String, keyword2: String): Page<List<Article>>
}