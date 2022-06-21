package com.dh.mascotas.persistence.repository;

import com.dh.mascotas.persistence.entities.Movimiento;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovimientoRepository extends JpaRepository<Movimiento, Integer> {
}
