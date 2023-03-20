package com.digitalmedia.users.service;

import com.digitalmedia.users.model.User;
import com.digitalmedia.users.model.dto.UserKeycloakDTO;
import com.digitalmedia.users.repository.MongoUserRepository;
import com.digitalmedia.users.repository.UserKeycloakRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements IUserService {

  private final MongoUserRepository userRepository;
  private final UserKeycloakRepository userKeycloakRepository;

  @Override
  public User validateAndGetUserExtra(String username) {
    return userRepository.validateAndGetUser(username);
  }

  @Override
  public Optional<User> getUserExtra(String username) {
    return userRepository.getUserExtra(username);
  }

  @Override
  public User saveUserExtra(User user) {
    return userRepository.saveUserExtra(user);
  }

  public List<User> getAll() {
    return userRepository.getUserAll();
  }

  public List<UserKeycloakDTO> getAllDBKeycloak() {
    return userKeycloakRepository.findAll();
  }

  public UserKeycloakDTO getById(String id) {
    return userKeycloakRepository.findById(id);
  }
}