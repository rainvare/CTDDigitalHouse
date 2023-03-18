package com.msbills.feign.service;

import com.msbills.feign.modelDTO.UserDTO;
import com.msbills.feign.repository.SubscriptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubscripcionService {

    @Autowired
    private SubscriptionRepository subscriptionRepository;

    public UserDTO findById(String id) {
        return subscriptionRepository.findByUserId(id);

    }
}
