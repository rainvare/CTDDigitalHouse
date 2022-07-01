package com.example.tecnico.repository;

import com.example.tecnico.modelo.Tecnico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface TecnicoRepository extends JpaRepository<Tecnico, Integer> {

    //1- un método que cree un nuevo Director Técnico, este método es el metodo save

    //2- un método para agregar jugadores al técnico,
    // debemos agregar un jugador al tecnico desde el add de la collection.
    //Ejemplo: tecnico.getJugadores().add(tecnico) y despues save,
    // por medio de la cascada va a crear al jugador si no existe



    @Query("SELECT t FROM Tecnico t where t.nombre = ?1")
    Tecnico buscarTecnicoPorNombre(String nombre);
}
