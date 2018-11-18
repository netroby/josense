package com.netroby.josense.repository


import com.netroby.josense.vo.Article
import org.springframework.data.repository.PagingAndSortingRepository

public interface ArticleRepository : PagingAndSortingRepository<Article, Long> {
    public List<Article> findByContentContaining(Pageable pageable, keyword: String)
}