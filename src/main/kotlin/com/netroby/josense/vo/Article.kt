package com.netroby.josense.vo

import lombok.Data
import lombok.ToString
import javax.persistence.Entity
import javax.persistence.Id

@Entity
@ToString
@Data
class Article {
    @Id
    val Aid: Long? = null;
    val Title: String = "";

}