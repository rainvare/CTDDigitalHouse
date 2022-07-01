package com.example.tecnico.service;

import com.example.tecnico.modelo.Jugador;

import java.util.List;
import java.util.Set;

public interface JugadorService {
    void crear(Jugador jugador);
    List<Jugador> recuperarPorNombreDeTecnico(String nombreTecnico);
    List<Jugador> obtenerJugadores();
}
