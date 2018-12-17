package com.netroby.josense.config

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.context.annotation.Configuration
import org.springframework.stereotype.Component

@Configuration
@ConfigurationProperties(prefix = "account")
@Component
class AccountConfig {
    var username: String = ""
    var password: String = ""
}