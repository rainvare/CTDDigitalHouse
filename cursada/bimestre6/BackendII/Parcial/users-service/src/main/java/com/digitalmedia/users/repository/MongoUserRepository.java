package com.digitalmedia.users.repository;

import com.digitalmedia.users.exceptions.UserExtraNotFoundException;
import com.digitalmedia.users.model.User;
import com.digitalmedia.users.repository.impl.IMongoUserRepository;
import com.digitalmedia.users.repository.impl.IUserRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class MongoUserRepository implements IUserRepository{
    private IMongoUserRepository mongoUserRepository;

    public MongoUserRepository(IMongoUserRepository mongoUserRepository) {
        this.mongoUserRepository = mongoUserRepository;
    }

    @Override
    public User validateAndGetUser(String username) {
        return  getUserExtra(username).orElseThrow(() -> new UserExtraNotFoundException(username));
    }

    @Override
    public Optional<User> getUserExtra(String username) {
        return mongoUserRepository.findById(username);
    }

    @Override
    public User saveUserExtra(User user) {
        return  mongoUserRepository.save(user);
    }

    public List<User> getUserAll(){
        return mongoUserRepository.findAll();
    }
}