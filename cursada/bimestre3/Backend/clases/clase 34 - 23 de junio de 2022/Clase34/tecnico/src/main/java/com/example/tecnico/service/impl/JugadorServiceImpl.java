package com.example.tecnico.service.impl;

import com.example.tecnico.modelo.Jugador;
import com.example.tecnico.repository.JugadorRepository;
import com.example.tecnico.service.JugadorService;
import org.springframework.beans.factory.annotation.Autowired;

public class JugadorServiceImpl implements JugadorService {

    private final JugadorRepository jugadorRepository;

    @Autowired
    public JugadorServiceImpl(JugadorRepository jugadorRepository) {
        this.jugadorRepository = jugadorRepository;
    }

    @Override
    public void crear(Jugador jugador) {
        jugadorRepository.save(jugador);
    }

    @Override
    public Jugador recuperarPorNombreDeTecnico(String nombreTecnico) {
        return jugadorRepository.obtenerJugadorPorNombreDeTecnico(nombreTecnico);
    }
}
