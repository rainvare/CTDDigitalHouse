package com.dh.apuestas.service;

import com.dh.apuestas.model.Estado;
import com.dh.apuestas.model.Partido;
import com.dh.apuestas.repository.PartidoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PartidoService {

    private PartidoRepository partidoRepository;

    public PartidoService(PartidoRepository partidoRepository) {
        this.partidoRepository = partidoRepository;
    }

    public Partido agregar(Partido partido){
        return partidoRepository.save(partido);
    }
    public List<Partido> listar(){
        return partidoRepository.findAll();
    }

    public List<Partido> partidosEnVivo(){
        return partidoRepository.findAllByEstado(Estado.EN_VIVO);
    }

}
