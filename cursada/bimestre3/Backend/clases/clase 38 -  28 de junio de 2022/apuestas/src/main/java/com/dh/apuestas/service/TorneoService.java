package com.dh.apuestas.service;

import com.dh.apuestas.model.Torneo;
import com.dh.apuestas.repository.TorneoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TorneoService {

    private TorneoRepository torneoRepository;

    public TorneoService(TorneoRepository torneoRepository) {
        this.torneoRepository = torneoRepository;
    }

    public Torneo guardarTorneo(Torneo torneo){
        return torneoRepository.save(torneo);
    }

    public List<Torneo> listarTorneos(){
        return torneoRepository.findAll();
    }


}
