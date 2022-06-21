package com.dh.app.controller;


import com.dh.app.persistence.entities.Usuario;
import com.dh.app.service.EjemploService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuariosController {

    @Autowired
    EjemploService service;

    @PostMapping("/crear")
    public ResponseEntity<String> crear(@RequestBody Usuario m){
        ResponseEntity<String> respuesta = null;

        if(service.save(m) != null){
            respuesta = ResponseEntity.ok("El usuario fue registrado con éxito");
        }else{
            respuesta = ResponseEntity.internalServerError().body("Ooops");
        }

        return respuesta;
    }

    @GetMapping("/todos")
    public ResponseEntity<List<Usuario>> consultarTodos(){
        return ResponseEntity.ok(service.obtenerTodos());
    }
}
