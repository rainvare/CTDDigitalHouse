package com.dh.weather;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class ApiWeatherServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiWeatherServiceApplication.class, args);
	}

}
