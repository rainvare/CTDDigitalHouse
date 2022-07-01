package com.dh.paqueteria.repository;

import com.dh.paqueteria.model.Estado;
import com.dh.paqueteria.model.Paquete;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaqueteRepository  extends MongoRepository<Paquete,Integer> {
        List<Paquete> findAllByEstado(Estado estado);
}
