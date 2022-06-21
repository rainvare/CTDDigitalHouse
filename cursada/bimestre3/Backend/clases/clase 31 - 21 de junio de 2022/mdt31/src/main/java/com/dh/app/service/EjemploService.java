package com.dh.app.service;

import com.dh.app.persistence.entities.Usuario;
import com.dh.app.persistence.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EjemploService {

    @Autowired
    UsuarioRepository repository;

    public String save(Usuario m){
        if(repository.save(m) != null){
            return "OK";
        }else{
            return null;
        }
    }

    public List<Usuario> obtenerTodos(){
        return repository.findAll();
    }

}
