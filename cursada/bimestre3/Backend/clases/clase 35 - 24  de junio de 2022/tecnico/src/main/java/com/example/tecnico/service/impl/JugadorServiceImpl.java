package com.example.tecnico.service.impl;

import com.example.tecnico.modelo.Jugador;
import com.example.tecnico.repository.JugadorRepository;
import com.example.tecnico.service.JugadorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
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
    public Set<Jugador> recuperarPorNombreDeTecnico(String nombreTecnico) {
        return jugadorRepository.obtenerJugadoresPorNombreDeTecnico(nombreTecnico);
    }

    @Override
    public Set<Jugador> obtenerJugadores() {
        return (Set<Jugador>) jugadorRepository.findAll();
    }
}
