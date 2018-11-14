package com.netroby.josense.vo

import lombok.Data
import lombok.ToString
import java.io.Serializable
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
    var publishStatus: Long = 0,
    var publishTime: Long = 0,
    var views: Long = 0
)