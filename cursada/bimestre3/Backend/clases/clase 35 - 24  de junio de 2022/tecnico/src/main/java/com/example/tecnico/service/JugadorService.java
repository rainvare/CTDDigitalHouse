package com.example.tecnico.service;

import com.example.tecnico.modelo.Jugador;

import java.util.Set;

public interface JugadorService {
    void crear(Jugador jugador);
    Set<Jugador> recuperarPorNombreDeTecnico(String nombreTecnico);
    Set<Jugador> obtenerJugadores();
}
