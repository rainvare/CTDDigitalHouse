package com.example.tecnico.service;

import com.example.tecnico.modelo.Jugador;

public interface JugadorService {
    void crear(Jugador jugador);
    Jugador recuperarPorNombreDeTecnico(String nombreTecnico);
}
