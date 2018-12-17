package com.netroby.josense.config

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.context.annotation.Configuration
import org.springframework.stereotype.Component

@Configuration
@ConfigurationProperties(prefix = "josense")
@Component
class JosenseConfig {
    var site: Map<String, String> = HashMap()
}