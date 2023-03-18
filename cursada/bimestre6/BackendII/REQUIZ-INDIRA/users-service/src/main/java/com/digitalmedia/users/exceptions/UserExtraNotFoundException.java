package com.digitalmedia.users.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class UserExtraNotFoundException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public UserExtraNotFoundException(String username) {
        super(String.format("User of %s not found", username));
    }
}
