package com.dh.apuestas.controller;

import com.dh.apuestas.model.Torneo;
import com.dh.apuestas.service.TorneoService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/torneos")
public class TorneoController {

    private TorneoService torneoService;

    public TorneoController(TorneoService torneoService) {
        this.torneoService = torneoService;
    }

    @PostMapping
    public Torneo agregarTorneo(@RequestBody Torneo torneo) {
        return torneoService.guardarTorneo(torneo);
    }

    @GetMapping
    public List<Torneo> listarTorneos() {
        return torneoService.listarTorneos();

    }
}
