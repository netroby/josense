package com.netroby.josense.service.impl

import com.netroby.josense.service.AuthAdapterService
import com.netroby.josense.service.PrepareModelService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component

@Component
class PrepareModelServiceImpl(
        @Autowired private val authAdapterService: AuthAdapterService
): PrepareModelService {
    override fun getModel(): HashMap<String, Any> {
            val map: java.util.HashMap<String, Any> = java.util.HashMap()
            map["username"] = authAdapterService.getUserName()?:""
            map["isAuthenticated"] = authAdapterService.isAuthenticated()?:false
            return map
    }
}