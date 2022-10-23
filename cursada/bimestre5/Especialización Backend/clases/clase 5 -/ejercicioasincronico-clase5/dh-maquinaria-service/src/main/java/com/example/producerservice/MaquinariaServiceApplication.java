package com.example.producerservice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class MaquinariaServiceApplication {
	public static void main(String[] args) {
		SpringApplication.run(MaquinariaServiceApplication.class, args);
	}
}

@RestController
class Maquinaria {
	@Value("${url_dnrpa}")
	private String urlDnrpa;
	
	@Value("${catalogo_maquina_maximo}")
	private String catalogoMaquinaMaximo;
	
	@RequestMapping(method = RequestMethod.GET, path ="/maquinaria/info")
	public Map<String, String> message() {
		Map<String, String> response = new HashMap<>();
		
		response.put("URL DNRPA", urlDnrpa);
		response.put("Catalogo maximo de maquinas", catalogoMaquinaMaximo);
		
		return response;
	}
}