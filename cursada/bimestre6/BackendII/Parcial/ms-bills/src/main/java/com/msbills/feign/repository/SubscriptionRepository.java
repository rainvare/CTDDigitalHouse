package com.msbills.feign.repository;

import com.msbills.feign.modelDTO.UserDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;


@Repository
public class SubscriptionRepository {

    private FeignSubscriptionRepository feignSubscriptionRepository;

    public SubscriptionRepository(FeignSubscriptionRepository feignSubscriptionRepository) {
        this.feignSubscriptionRepository = feignSubscriptionRepository;
    }

    public UserDTO findByUserId(String userId){
        ResponseEntity<UserDTO> response = feignSubscriptionRepository.findByUserId(userId);
        return response.getBody();
    }

}
