package com.dh.gateway;

import io.netty.resolver.DefaultAddressResolverGroup;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;
import reactor.netty.http.client.HttpClient;


@SpringBootApplication
@EnableDiscoveryClient
public class MsGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(MsGatewayApplication.class, args);
    }

//    @Bean
//    public HttpClient httpClient() {
//        return HttpClient.create().resolver(DefaultAddressResolverGroup.INSTANCE);
//    }
}
