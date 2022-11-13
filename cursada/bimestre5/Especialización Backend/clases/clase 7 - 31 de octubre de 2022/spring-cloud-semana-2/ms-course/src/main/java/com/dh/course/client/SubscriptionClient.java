package com.dh.course.client;

import com.dh.course.configuration.LoadBalanceConfiguration;
import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient("ms-subscription")
@Component
@LoadBalancerClient(name = "ms-subscription",configuration = LoadBalanceConfiguration.class)
public interface SubscriptionClient {

    @GetMapping("/subscription/find")
    String find();
}
