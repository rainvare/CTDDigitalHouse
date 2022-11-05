package com.dh.Wesped.Security.Payload;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class RegisterRequest {

    @NotBlank
    private String name;
    @NotBlank
    private String surname;
    @Email
    private String email;
    @NotBlank
    private String password;
}