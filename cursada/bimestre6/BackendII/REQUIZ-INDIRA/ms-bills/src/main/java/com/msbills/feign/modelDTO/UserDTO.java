package com.msbills.feign.modelDTO;
import javax.persistence.*;

@Embeddable
public class UserDTO {

    private String username;
    private String lastName;

    public UserDTO(String username, String lastName) {
        this.username = username;
        this.lastName = lastName;
    }

    public UserDTO() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}