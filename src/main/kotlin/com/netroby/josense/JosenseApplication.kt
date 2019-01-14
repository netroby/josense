package com.netroby.josense

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.scheduling.support.TaskUtils
import freemarker.ext.dom.NodeModel.setErrorHandler
import org.springframework.context.annotation.Bean
import org.springframework.core.task.SimpleAsyncTaskExecutor
import org.springframework.context.event.SimpleApplicationEventMulticaster
import org.springframework.context.event.ApplicationEventMulticaster
import org.springframework.scheduling.annotation.EnableAsync


@SpringBootApplication
@EnableAsync
class JosenseApplication

@Bean
fun applicationEventMulticaster(): ApplicationEventMulticaster {
    val eventMulticaster = SimpleApplicationEventMulticaster()
    eventMulticaster.setTaskExecutor(SimpleAsyncTaskExecutor())
    eventMulticaster.setErrorHandler(TaskUtils.LOG_AND_SUPPRESS_ERROR_HANDLER)
    return eventMulticaster
}

fun main(args: Array<String>) {
    runApplication<JosenseApplication>(*args)

}