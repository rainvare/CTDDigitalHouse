package com.msbills;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class MsBillsApplication {

    public static void main(String[] args) {
        SpringApplication.run(MsBillsApplication.class, args);
    }

}
