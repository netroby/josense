package com.netroby.josense.service.impl

import com.netroby.josense.service.AuthAdapterService
import org.springframework.security.core.Authentication
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Component

@Component
class AuthAdapterServiceImpl : AuthAdapterService {
    override fun getAuthentication(): Authentication? {
        return SecurityContextHolder.getContext()?.authentication
    }

    override fun getUserName(): String? {
        return getAuthentication()?.name
    }
    override fun isAuthenticated(): Boolean? {
        // 是否有admin权限
        return getAuthentication()?.authorities?.contains(SimpleGrantedAuthority("ROLE_ADMIN"))
    }
}