package com.example.tecnico.controller;

import com.example.tecnico.modelo.Jugador;
import com.example.tecnico.modelo.Tecnico;
import com.example.tecnico.service.TecnicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/tecnicos")
public class TecnicoController {

    private final TecnicoService tecnicoService;

    @Autowired
    public TecnicoController(TecnicoService tecnicoService) {
        this.tecnicoService = tecnicoService;
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

    @PostMapping("/addJugadores/{nombreTecnico}")
    public String addJugadoresToTecnico(@RequestBody Set<Jugador> jugadores,
                                        @PathVariable String nombreTecnico) {
        Tecnico tecnico = tecnicoService.recuperarTecnicoPorNombre(nombreTecnico);
        tecnico.setJugadores(jugadores);
        System.out.println("LISTA JUGADORES: " + tecnico.getJugadores());
        return "Jugadores agregados con éxito";
    }
}
