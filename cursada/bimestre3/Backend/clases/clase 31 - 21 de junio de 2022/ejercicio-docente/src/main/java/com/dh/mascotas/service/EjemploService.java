package com.dh.mascotas.service;

import com.dh.mascotas.persistence.entities.Movimiento;
import com.dh.mascotas.persistence.repository.MovimientoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EjemploService {

    @Autowired
    MovimientoRepository repository;

    public String save(Movimiento m){
        if(repository.save(m) != null){
            return "OK";
        }else{
            return null;
        }
    }

    public List<Movimiento> obtenerTodos(){
        return repository.findAll();
    }

}
