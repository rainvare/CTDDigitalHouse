package com.dh.course.controller;


import com.dh.course.client.SubscriptionClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CourseController {

    private final SubscriptionClient subscriptionClient;

    public CourseController(SubscriptionClient subscriptionClient) {
        this.subscriptionClient = subscriptionClient;
    }

    @GetMapping("/course/find")
    public ResponseEntity<String> find() {
        return ResponseEntity.ok(subscriptionClient.find());
    }
}
