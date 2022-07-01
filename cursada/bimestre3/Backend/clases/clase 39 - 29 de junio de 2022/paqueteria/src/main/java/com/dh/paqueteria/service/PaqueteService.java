package com.dh.paqueteria.service;

import com.dh.paqueteria.model.Estado;
import com.dh.paqueteria.model.Paquete;
import com.dh.paqueteria.repository.PaqueteRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaqueteService {

    private PaqueteRepository paqueteRepository;

    public PaqueteService(PaqueteRepository paqueteRepository) {
        this.paqueteRepository = paqueteRepository;
    }

    public Paquete agregar(Paquete paquete){

        return paqueteRepository.save(paquete);

    }

    public List<Paquete> listar(){
        return paqueteRepository.findAll();
    }
    public List<Paquete> paquetesEnCamino(){
        return paqueteRepository.findAllByEstado(Estado.EN_CAMINO);
    }



}
