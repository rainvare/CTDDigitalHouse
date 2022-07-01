package com.example.tecnico.controller;

import com.example.tecnico.dto.JugadorDto;
import com.example.tecnico.modelo.Jugador;
import com.example.tecnico.service.JugadorService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/jugadores")
public class JugadorController {

    private final JugadorService jugadorService;
    private final ObjectMapper objectMapper = new ObjectMapper();

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
    public List<Jugador> getJugadoresPorNombreDeTecnico(@PathVariable(name = "nombreTecnico") String nombreTecnico) {

        /*List<Jugador> jugadoresList = jugadorService.recuperarPorNombreDeTecnico(nombreTecnico);
        List<JugadorDto> jugadorDtoList = new ArrayList<>();
        JugadorDto jugadorDto;
        for (Jugador jugador : jugadoresList) {
            jugadorDto = objectMapper.convertValue(jugador, JugadorDto.class);
            jugadorDtoList.add(jugadorDto);
        }
        return jugadorDtoList;*/

        return jugadorService.recuperarPorNombreDeTecnico(nombreTecnico);

    }

    @GetMapping()
    public List<Jugador> getJugadores() {
        return jugadorService.obtenerJugadores();
    }

}
