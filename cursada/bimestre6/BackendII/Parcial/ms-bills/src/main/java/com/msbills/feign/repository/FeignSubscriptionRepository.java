package com.msbills.feign.repository;

import com.msbills.feign.FeignInterceptor;
import com.msbills.feign.modelDTO.UserDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(name= "subscription-service",url = "http://localhost:8087", configuration = FeignInterceptor.class)
public interface FeignSubscriptionRepository {

    @RequestMapping(method = RequestMethod.GET,value = "/users/{userId}")
    ResponseEntity<UserDTO> findByUserId(@PathVariable String userId);
}
