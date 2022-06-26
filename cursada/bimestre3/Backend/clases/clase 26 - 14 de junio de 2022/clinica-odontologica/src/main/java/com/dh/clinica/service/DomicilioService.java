package com.dh.clinica.service;


import com.dh.clinica.dao.IDao;
import com.dh.clinica.model.Domicilio;

import java.util.List;
import java.util.Optional;

public class DomicilioService {
    private IDao<Domicilio> domicilioDao;

    public DomicilioService(IDao<Domicilio> domicilioDao) {
        this.domicilioDao = domicilioDao;
    }

    public Domicilio guardar(Domicilio d) {
        domicilioDao.guardar(d);
        return d;
    }

    public Optional<Domicilio> buscar(Integer id) {
        return domicilioDao.buscar(id);
    }

    public List<Domicilio> buscarTodos() {
        return domicilioDao.buscarTodos();
    }

    public void eliminar(Integer id) {
        domicilioDao.eliminar(id);
    }

}
