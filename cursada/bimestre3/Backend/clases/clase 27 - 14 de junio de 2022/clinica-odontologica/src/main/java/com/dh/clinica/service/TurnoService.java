package com.dh.clinica.service;

import com.dh.clinica.repository.IDao;
import com.dh.clinica.model.Turno;

import java.util.List;
import java.util.Optional;

public class TurnoService {

    private IDao<Turno> turnoRepository;

    public TurnoService(IDao<Turno> turnoRepository) {
        this.turnoRepository = turnoRepository;
    }

    public Turno registrarTurno(Turno turno){
        return  turnoRepository.guardar(turno);
    }
    public List<Turno> listar(){
        return turnoRepository.buscarTodos();
    }


}
