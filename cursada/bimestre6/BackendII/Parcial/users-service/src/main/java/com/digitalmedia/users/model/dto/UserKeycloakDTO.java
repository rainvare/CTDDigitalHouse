package com.digitalmedia.users.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Data
public class UserKeycloakDTO {
    private String userName;
    private String email;

    public UserKeycloakDTO(String userName, String email) {
        this.userName = userName;
        this.email = email;
    }
}