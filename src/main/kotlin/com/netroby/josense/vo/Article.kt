package com.netroby.josense.vo

import lombok.Data
import lombok.ToString
import java.io.Serializable
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
@ToString
@Data
class Article : Serializable {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    var aid: Long = 0;
    var title: String = "";
    var content: String = "";

}