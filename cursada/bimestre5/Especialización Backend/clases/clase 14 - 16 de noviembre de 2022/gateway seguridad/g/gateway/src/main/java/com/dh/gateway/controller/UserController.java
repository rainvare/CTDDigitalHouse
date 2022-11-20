package com.dh.gateway.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {

    @GetMapping("/api/v1/user/login")
    public Map<String, Object> login(@RequestHeader HttpHeaders headers,@AuthenticationPrincipal OAuth2User principal) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("SESSION",headers.get(HttpHeaders.COOKIE) );
        result.put("USER",principal);
        return result;
    }


    @RequestMapping("/user")
    public Map<String, Object> user(@AuthenticationPrincipal OAuth2User principal) {
        return Collections.singletonMap("name", principal.getAttribute("name"));
    }

}