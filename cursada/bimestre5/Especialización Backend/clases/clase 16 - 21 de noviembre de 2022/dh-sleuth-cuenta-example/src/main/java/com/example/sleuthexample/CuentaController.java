package com.example.sleuthexample;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.logging.Logger;

@RestController
@RequestMapping("/cuenta")
public class CuentaController {

    private static java.util.logging.Logger log = Logger.getLogger(CuentaController.class.getName());

    @Autowired
    private RestTemplate restTemplate;

    @PostMapping("/{idOrigen}/transferir/{idDestino}")
    public ResponseEntity<String> transferirMonto(@PathVariable("idOrigen") Long idCuentaOrigen
            , @PathVariable("idDestino") Long idCuentaDestino, @RequestBody Double monto){

        log.info("Transfiriendo : " + monto + ", cuenta origen : " + idCuentaOrigen
                + ", cuenta destino :" + idCuentaDestino);


        restTemplate.exchange("http://localhost:9092/limite/validar/" + idCuentaOrigen , HttpMethod.POST,
                new HttpEntity<Double>(monto) , String.class);

        return ResponseEntity.ok("TransferenciaRealizada");
    }

}
