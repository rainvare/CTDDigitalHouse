package com.dh.Wesped.Service;

import com.dh.Wesped.Model.User;
import com.dh.Wesped.Repository.UserRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserService {

    private static final Logger logger = Logger.getLogger(UserService.class);
    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User newUser(User user) {
        logger.debug("Guardando nuevo usuario: " + user);
        return userRepository.save(user);
    }

    public List<User> getAllUsers() {
        logger.debug("Listando usuarios: ");
        return userRepository.findAll();
    }

    public User userByEmail(String email) {
        logger.debug("Buscando usuario con email: " + email);
        return userRepository.findByEmail(email);
    }

    public Boolean existsUserByEmail(String email) {
        return userRepository.existsByEmail(email);
    }
}