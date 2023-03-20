package com.digitalmedia.users.repository;
import com.digitalmedia.users.model.dto.UserKeycloakDTO;
import com.digitalmedia.users.repository.impl.IUserKeycloakRepository;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.GroupRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Repository
public class UserKeycloakRepository implements IUserKeycloakRepository {

    @Autowired
    private Keycloak keycloakClient;

    @Value("${spring.security.oauth2.client.registration.keycloak.realm}")
    private String realm;

    public List<UserKeycloakDTO> findAll() {
        List<UserRepresentation> users =  keycloakClient.realm(realm).users().list();
        List<UserKeycloakDTO> lv_retorno = new ArrayList<>();

        List<UserRepresentation> userNoAdmin = users.stream().filter(userRepresentation -> {
            List<GroupRepresentation> groups = keycloakClient.realm(realm).users().get(userRepresentation.getId()).groups();
            return groups.stream().noneMatch(s -> Objects.equals(s.getName(), "admin"));
        }).collect(Collectors.toList());

        userNoAdmin.stream().forEach(user -> lv_retorno.add(new UserKeycloakDTO(user.getUsername(),user.getEmail())));

        return lv_retorno;
    }


    public UserKeycloakDTO findById(String id){
        UsersResource userResource = keycloakClient.realm(realm).users();
        UserRepresentation user = userResource.get(id).toRepresentation();

        return new UserKeycloakDTO(user.getUsername(),user.getEmail());
    }

}