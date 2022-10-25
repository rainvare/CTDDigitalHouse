package com.dh.weather.service;


import org.springframework.stereotype.Service;

@Service
public class ClimaService {

    public String calcularClima(String ciudad,String pais){
        return "25 ºC";
    }
}
