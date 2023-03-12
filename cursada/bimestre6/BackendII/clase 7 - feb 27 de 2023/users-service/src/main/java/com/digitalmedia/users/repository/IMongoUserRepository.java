package com.digitalmedia.users.repository;

import com.digitalmedia.users.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.Optional;

public interface IMongoUserRepository extends MongoRepository<User,String> {
}


