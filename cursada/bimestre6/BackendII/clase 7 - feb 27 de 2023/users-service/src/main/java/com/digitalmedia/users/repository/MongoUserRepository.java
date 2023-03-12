package com.digitalmedia.users.repository;

import com.digitalmedia.users.exceptions.UserExtraNotFoundException;
import com.digitalmedia.users.model.User;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public class MongoUserRepository implements IUserRepository {
    private IMongoUserRepository mongoUserRepository;

    public MongoUserRepository(IMongoUserRepository mongoUserRepository) {
        this.mongoUserRepository = mongoUserRepository;
    }

    @Override
    public User validateAndGetUser(String username) {
        return getUserExtra(username).orElseThrow(() -> new UserExtraNotFoundException(username));
    }

    @Override
    public Optional<User> getUserExtra(String username) {
        return mongoUserRepository.findById(username);
    }

    @Override
    public User saveUserExtra(User user) {
        return mongoUserRepository.save(user);
    }
}