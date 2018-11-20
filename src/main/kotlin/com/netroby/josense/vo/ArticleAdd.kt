package com.netroby.josense.vo

import javax.persistence.*

@Entity
@Table(name="jo_article")
data class ArticleAdd  (
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    var title: String = "",
    var content: String = "",
    var publishStatus: Long = 1,
    var views: Long = 0
)