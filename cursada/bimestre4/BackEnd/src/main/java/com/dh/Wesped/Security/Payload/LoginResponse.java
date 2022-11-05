package com.dh.Wesped.Security.Payload;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

@Getter
@Setter
public class LoginResponse {

    private String token;
    @JsonIgnore
    private Collection<? extends GrantedAuthority> authorities;

    public LoginResponse(String token) {
        this.token = token;
    }
}