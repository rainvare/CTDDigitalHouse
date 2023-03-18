package com.digitalmedia.users.model;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Data
public class UserKeycloak {

    @Id
    private String userName;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private Date birthDate;
}