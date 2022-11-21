package com.example.sleuthexample;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.logging.Logger;

@RestController
@RequestMapping("/limite")
public class LimiteController {

    private static java.util.logging.Logger log = Logger.getLogger(LimiteController.class.getName());

    @Autowired
    private RestTemplate restTemplate;

    @PostMapping("/validar/{idCuenta}")
    public ResponseEntity<String> validarLimiteTransferencia(@PathVariable("idCuenta") Long idCuenta, @RequestBody Double monto){

        log.info("Validando : " + monto + ", para la cuenta cuenta  : " + idCuenta);

        return ResponseEntity.ok("Limite Validado");
    }

    @GetMapping("/test")
    public ResponseEntity<String> test(){
        log.info("TEST");
        return ResponseEntity.ok("TransferenciaRealizada");
    }

}
