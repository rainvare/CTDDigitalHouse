package com.dh.clinica.service;

import com.dh.clinica.exceptions.BadRequestException;
import com.dh.clinica.exceptions.ResourceNotFoundException;
import com.dh.clinica.repository.IDao;
import com.dh.clinica.model.Turno;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class TurnoService {

    private IDao<Turno> turnoRepository;

    private PacienteService pacienteService;
    private OdontologoService odontologoService;

    public TurnoService(IDao<Turno> turnoRepository, PacienteService pacienteService, OdontologoService odontologoService) {
        this.turnoRepository = turnoRepository;
        this.pacienteService = pacienteService;
        this.odontologoService = odontologoService;
    }

    public Turno registrarTurno(Turno turno) throws BadRequestException{
        if (pacienteService.buscar(turno.getPaciente().getId()).isEmpty() || odontologoService.buscar(turno.getOdontologo().getId()).isEmpty())
            throw new BadRequestException("El paciente o el odontologo no existen");

            return  turnoRepository.guardar(turno);
    }
    public List<Turno> listar(){
        return turnoRepository.buscarTodos();
    }
    public void eliminar(Integer id)throws  ResourceNotFoundException{
        if(buscar(id) .isEmpty())
            throw  new ResourceNotFoundException("No existe turno con id: "+id);

        turnoRepository.eliminar(id);
    }
    public Turno actualizar(Turno turno){
        return turnoRepository.actualizar(turno);
    }
    public Optional<Turno> buscar(Integer id){
        return turnoRepository.buscar(id);
    }

}
