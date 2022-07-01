package com.dh.apuestas.controller;

import com.dh.apuestas.model.Partido;
import com.dh.apuestas.service.PartidoService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/partidos")
public class PartidoController {

    private PartidoService partidoService;

    public PartidoController(PartidoService partidoService) {
        this.partidoService = partidoService;
    }
    @PostMapping
    public Partido registrar(@RequestBody Partido partido){
        return partidoService.agregar(partido);
    }
    @GetMapping
    public List<Partido> listar(){
        return partidoService.listar();
    }
    @GetMapping("/en-vivo")
    public List<Partido> partidosEnVivo(){
        return partidoService.partidosEnVivo();
    }
}
