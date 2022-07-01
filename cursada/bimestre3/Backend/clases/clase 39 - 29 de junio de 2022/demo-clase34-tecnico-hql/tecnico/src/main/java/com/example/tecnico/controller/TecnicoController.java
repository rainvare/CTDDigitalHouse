package com.example.tecnico.controller;

import com.example.tecnico.modelo.Jugador;
import com.example.tecnico.modelo.Tecnico;
import com.example.tecnico.service.JugadorService;
import com.example.tecnico.service.TecnicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/tecnicos")
public class TecnicoController {

    private final TecnicoService tecnicoService;
    private final JugadorService jugadorService;

    @Autowired
    public TecnicoController(TecnicoService tecnicoService, JugadorService jugadorService) {
        this.tecnicoService = tecnicoService;
        this.jugadorService = jugadorService;
    }

    @PostMapping("/new")
    public String registrarTecnico(@RequestBody Tecnico tecnico) {
        tecnicoService.crear(tecnico);
        return "CREADO OK";
    }

    @GetMapping
    public List<Tecnico> tecnicos() {
        return tecnicoService.getAllTecnicos();
    }

    @PutMapping("/addJugadores/{nombreTecnico}")
    public String addJugadoresToTecnico(@RequestBody Set<Jugador> jugadores,
                                        @PathVariable String nombreTecnico) {
        Tecnico tecnico = tecnicoService.recuperarTecnicoPorNombre(nombreTecnico);

        for (Jugador jugador : jugadores) {
            jugador.setTecnico(tecnico);
            jugadorService.crear(jugador);
        }

        /*tecnico.getJugadores().addAll(jugadores);
        tecnicoService.crear(tecnico);*/
        System.out.println("LISTA JUGADORES: " + jugadores);
        return "Jugadores agregados con éxito";
    }
}
