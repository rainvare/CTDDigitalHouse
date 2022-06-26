package com.example.entrenador.service.impl;


import com.example.entrenador.model.Entrenador;
import com.example.entrenador.service.EntrenadorService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
@Service
public class EntrenadorServiceImpl implements EntrenadorService {
    @Override
    public List<Entrenador> listaEntrenador() {
        return Arrays.asList(new Entrenador("Pibe"), new Entrenador("Roman"));
    }
}

