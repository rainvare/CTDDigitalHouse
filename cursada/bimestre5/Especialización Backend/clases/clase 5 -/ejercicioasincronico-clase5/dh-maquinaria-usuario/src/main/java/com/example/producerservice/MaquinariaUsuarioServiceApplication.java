package com.example.producerservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class MaquinariaUsuarioServiceApplication {
	public static void main(String[] args) {
		SpringApplication.run(MaquinariaUsuarioServiceApplication.class, args);
	}
}

@RestController
class MaquinariaUsuario {
	@Value("${max_login_fail}")
	private String maxLoginFail;
	
	@Value("${domain_mail_enabled}")
	private String[] domainMailEnabled;
	
	@RequestMapping(method = RequestMethod.GET, path ="/usuario/info")
	public Map<String, String> message() {
		Map<String, String> response = new HashMap<>();
		
		response.put("Cantidad maxima de login fallidos", maxLoginFail);

		int i = 1;
		for (String domain:domainMailEnabled) {
			response.put("domainMailEnabled" + i, domain);
			i++;
		}

		return response;
	}
}