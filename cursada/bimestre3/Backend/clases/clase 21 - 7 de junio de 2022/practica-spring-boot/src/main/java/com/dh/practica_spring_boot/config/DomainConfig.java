package com.dh.practica_spring_boot.config;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@EntityScan("com.dh.practica_spring_boot.domain")
@EnableJpaRepositories("com.dh.practica_spring_boot.repos")
@EnableTransactionManagement
public class DomainConfig {
}
