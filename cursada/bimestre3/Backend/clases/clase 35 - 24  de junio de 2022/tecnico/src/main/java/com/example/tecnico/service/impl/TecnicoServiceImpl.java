package com.example.tecnico.service.impl;

import com.example.tecnico.modelo.Jugador;
import com.example.tecnico.modelo.Tecnico;
import com.example.tecnico.repository.TecnicoRepository;
import com.example.tecnico.service.TecnicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TecnicoServiceImpl implements TecnicoService {

    private final TecnicoRepository tecnicoRepository;

    @Autowired
    public TecnicoServiceImpl(TecnicoRepository tecnicoRepository) {
        this.tecnicoRepository = tecnicoRepository;
    }

    @Override
    public void crear(Tecnico tecnico) {
        tecnicoRepository.save(tecnico);
    }

    @Override
    public List<Tecnico> getAllTecnicos() {
        return tecnicoRepository.findAll();
    }

    @Override
    public Tecnico recuperarTecnicoPorNombre(String nombre) {
        return tecnicoRepository.buscarTecnicoPorNombre(nombre);
    }

}
