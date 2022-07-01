package com.example.tecnico.service;

import com.example.tecnico.modelo.Jugador;
import com.example.tecnico.modelo.Tecnico;

import java.util.List;

public interface TecnicoService {

    void crear(Tecnico tecnico);
    List<Tecnico> getAllTecnicos();
    Tecnico recuperarTecnicoPorNombre(String nombre);
}
