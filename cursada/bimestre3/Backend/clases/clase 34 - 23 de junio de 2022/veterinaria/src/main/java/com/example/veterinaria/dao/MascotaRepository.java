package com.example.veterinaria.dao;

import com.example.veterinaria.modelo.Mascota;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MascotaRepository extends JpaRepository<Mascota, Long> {
    @Query("SELECT t FROM Mascota t where t.tipo = ?1")
    Optional<Mascota> buscarMascota(String tipo);
}
