package com.digitalmedia.users.controller;

import com.digitalmedia.users.model.User;
import com.digitalmedia.users.model.dto.UserKeycloakDTO;
import com.digitalmedia.users.model.dto.UserRequest;
import com.digitalmedia.users.service.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@RestController
@RequestMapping("/users")
public class UserController {

  @Autowired
  private final UserServiceImpl userService ;

  @GetMapping("/all")
  public List<User> getUserAll(Principal principal) {
    return userService.getAll();
  }

  @GetMapping("/{id}")
  public User getUser(@Valid @PathVariable String id) {
    return userService.validateAndGetUserExtra(id);
  }

  @PostMapping("/save")
  public User saveUser(@Valid @RequestBody UserRequest updateUserRequest, Principal principal) {
    Optional<User> userOptional = userService.getUserExtra(updateUserRequest.getUsername());
    User userExtra = userOptional.orElseGet(() -> new User(updateUserRequest.getUsername()));
    userExtra.setLastname(updateUserRequest.getLastname());
    userExtra.setAvatar(updateUserRequest.getAvatar());
    return userService.saveUserExtra(userExtra);
  }

  @GetMapping("/admin")
  @PreAuthorize("hasAuthority('GROUP_admin')")
  public List<UserKeycloakDTO> getAllUserKeycloakNotAdmin(){
    return userService.getAllDBKeycloak();
  }
}
