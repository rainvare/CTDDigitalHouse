package com.dh.clinica.service;

import com.dh.clinica.DAO.IDao;
import com.dh.clinica.model.Odontologo;

import java.util.List;

public class OdontologoService {

    /* Atributos de mi Service */

    private IDao<Odontologo> odontologoIDao;

    /* Getters Y Setters */

    public IDao<Odontologo> getOdontologoIDao() {
        return odontologoIDao;
    }

    public void setOdontologoIDao(IDao<Odontologo> odontologoIDao) {
        this.odontologoIDao = odontologoIDao;
    }

    /* Constructor del service */

    public OdontologoService(IDao<Odontologo> odontologoIDao) {
        this.odontologoIDao = odontologoIDao;
    }

    /* Métodos */

    public void vaciar(){
        odontologoIDao.vaciar();
    }

    public Odontologo guardar (Odontologo o){
        return odontologoIDao.guardar(o);
    }

    public Odontologo buscar(Integer id){
        return odontologoIDao.buscar(id);
    }

    public List<Odontologo> listarTodos(){
        return odontologoIDao.listarTodos();
    }

}
