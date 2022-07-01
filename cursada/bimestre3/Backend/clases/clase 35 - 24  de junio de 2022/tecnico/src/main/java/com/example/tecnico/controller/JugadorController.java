package com.example.tecnico.controller;

import com.example.tecnico.modelo.Jugador;
import com.example.tecnico.service.JugadorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Set;

@RestController
@RequestMapping("/jugadores")
public class JugadorController {

    private final JugadorService jugadorService;

    @Autowired
    public JugadorController(JugadorService jugadorService) {
        this.jugadorService = jugadorService;
    }

    @PostMapping("/new")
    public String crearJugador(Jugador jugador) {
        jugadorService.crear(jugador);
        return "JUGADOR CREADO OK";
    }

    @GetMapping("/{nombreTecnico}")
    public Set<Jugador> getJugadoresPorNombreDeTecnico(@PathVariable String nombreTecnico) {
        return jugadorService.recuperarPorNombreDeTecnico(nombreTecnico);
    }

    @GetMapping()
    public Set<Jugador> getJugadores() {
        return jugadorService.obtenerJugadores();
    }

}
