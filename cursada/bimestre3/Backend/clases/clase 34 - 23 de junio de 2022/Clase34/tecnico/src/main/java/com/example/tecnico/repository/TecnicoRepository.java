package com.example.tecnico.repository;

import com.example.tecnico.modelo.Tecnico;
import org.springframework.data.jpa.repository.Query;

public interface TecnicoRepository {

    @Query("SELECT t FROM Tecnico t where t.nombre = ?1")
    Tecnico buscarTecnicoPorNombre(String nombre);
}
