package com.netroby.josense.vo

import lombok.Data
import lombok.ToString
import java.io.Serializable
import javax.persistence.*

@Entity
@ToString
@Data
@Table(name="jo_article")
data class ArticleEdit  (
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    var aid: Long = 0,
    var title: String = "",
    var content: String = ""
)