package com.example.tecnico.repository;

import com.example.tecnico.modelo.Jugador;
import com.example.tecnico.modelo.Tecnico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface JugadorRepository extends JpaRepository<Jugador, Long> {

    @Query("SELECT j FROM Jugador j WHERE j.tecnico.nombre = ?1")
    Set<Jugador> obtenerJugadoresPorNombreDeTecnico(String nombreDeTecnico);

    // TODO: probar si se puede recuperar pasando como argumento un objeto de tipo Tecnico
    //Set<Jugador> findAllByTecnico(Tecnico tecnico);

}
