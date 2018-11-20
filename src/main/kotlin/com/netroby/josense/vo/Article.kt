package com.netroby.josense.vo

import java.time.Instant
import javax.persistence.*

@Entity
@Table(name="jo_article")
data class Article  (
        @Id  @GeneratedValue(strategy = GenerationType.IDENTITY)
    var aid: Long = 0,
        var title: String = "",
        var content: String = "",
        var publishStatus: Int = 0,
        var publishTime: Long =     Instant.now().epochSecond,
        var views: Long = 0
)