package com.netroby.josense.repository


import com.netroby.josense.vo.Article
import org.springframework.data.repository.CrudRepository;
public interface ArticleRepository : CrudRepository<Article, Long> {

}