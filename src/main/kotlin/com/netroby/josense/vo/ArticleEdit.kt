package com.netroby.josense.vo

import javax.persistence.*

@Entity
@Table(name="jo_article")
data class ArticleEdit  (
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    var aid: Long = 0,
    var title: String = "",
    var content: String = ""
)