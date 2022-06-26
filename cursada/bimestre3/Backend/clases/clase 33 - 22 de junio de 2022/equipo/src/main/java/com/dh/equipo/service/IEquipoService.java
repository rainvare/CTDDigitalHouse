package com.dh.main.service;
import com.dh.main.entity.Equipo;
import java.util.List;
import java.util.Optional;

public interface IEquipoService {

    public abstract List<Equipo> readALl();

    public abstract Optional<Equipo> readOne(Long id);

    public abstract Optional<Equipo> insert(Equipo equipo);

    public abstract Boolean delete(Long id);

    public abstract Boolean update(Equipo equipo);

}