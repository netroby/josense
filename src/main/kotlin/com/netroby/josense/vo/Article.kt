package com.netroby.josense.vo

import lombok.Data
import lombok.ToString
import java.io.Serializable
import java.text.SimpleDateFormat
import java.time.Instant
import java.time.ZoneOffset
import java.time.format.DateTimeFormatter
import java.util.*
import javax.persistence.*

@Entity
@ToString
@Data
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