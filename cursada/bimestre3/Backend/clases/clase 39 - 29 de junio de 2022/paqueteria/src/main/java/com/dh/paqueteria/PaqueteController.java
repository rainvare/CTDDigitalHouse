package com.dh.paqueteria;

import com.dh.paqueteria.model.Paquete;
import com.dh.paqueteria.service.PaqueteService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/paquetes")
public class PaqueteController {

    private PaqueteService paqueteService;

    public PaqueteController(PaqueteService paqueteService) {
        this.paqueteService = paqueteService;
    }

    @PostMapping
    public Paquete registar(@RequestBody Paquete paquete){
        return paqueteService.agregar(paquete);
    }
    @GetMapping
    public List<Paquete> listar(){
        return paqueteService.listar();
    }
    @GetMapping("/en-camino")
    public List<Paquete> enCamino(){
        return paqueteService.paquetesEnCamino();
    }
}
