package com.netroby.josense.vo

import lombok.Data
import lombok.ToString
import javax.persistence.*

@Entity
@ToString
@Data
@Table(name="jo_article")
data class ArticleAdd  (
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    var title: String = "",
    var content: String = "",
    var publishStatus: Long = 1,
    var publishTime: Long = 0,
    var views: Long = 0
)