package com.dh.Wesped.Security.Payload;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class LoginRequest {

    @NotBlank
    private String email;
    @NotBlank
    private String password;
}
