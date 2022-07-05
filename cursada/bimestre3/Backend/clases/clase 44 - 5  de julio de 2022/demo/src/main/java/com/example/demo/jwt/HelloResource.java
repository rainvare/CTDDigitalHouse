package com.example.demo.jwt;

import com.example.demo.model.AuthenticationRequest;
import com.example.demo.model.AuthenticationResponse;
import com.example.demo.model.Jugador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

@RestController
public class HelloResource {

    //Ejercicio 1
    @GetMapping({"/hello"})
    public String hello() {
        return "Hola Mundo JWT";
    }

    //Ejercicio 2
    @GetMapping({"/adios"})
    public String adios() {
        return "Adios Mundo JWT";
    }

    //Ejercicio 3
    @PostMapping({"/crear-jugador"})
    public Jugador crearJugador(@RequestBody Jugador jugador) {
        return jugador;
    }
}
