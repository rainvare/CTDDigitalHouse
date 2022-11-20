package com.dh.course.client;

import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import io.github.resilience4j.retry.annotation.Retry;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "api-student")
public interface StudentFeign {

    @GetMapping("/api/v1/students/{id}")
    Student getById(@PathVariable Long id);



    @Getter
    @Setter
    class Student {
        private Long studentId;
        private String name;
        private String lastName;
    }
}
