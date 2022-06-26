package com.dh.service;

import com.dh.dao.IDao;
import com.dh.model.Medicamento;
import org.apache.log4j.Logger;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Farmacia {

    private IDao<Medicamento> medicamentoIDao;
    private static Logger logger = Logger.getLogger(Farmacia.class);

    public Farmacia(IDao<Medicamento> medicamentoIDao) {
        this.medicamentoIDao = medicamentoIDao;
    }

    public Medicamento consultarPorId(Integer id) {
        Medicamento medicamento = null;
        try {
            medicamento = medicamentoIDao.consultarPorId(id);
        } catch(SQLException e) {
            logger.error(e.getMessage());
        }
        return medicamento;
    }

    public Integer insertarNuevo(Medicamento medicamento) {
        Integer cantidadElementos = -1;
        try {
            cantidadElementos = medicamentoIDao.insertarNuevo(medicamento);
        } catch(SQLException e) {
            logger.error(e.getMessage());
        }
        return cantidadElementos;
    }

    public List<Medicamento> consultarTodos() {
        List<Medicamento> medicamentos = new ArrayList<>();
        try {
            medicamentos = medicamentoIDao.consultarTodos();
        } catch(SQLException e) {
            logger.error(e.getMessage());
        }
        return medicamentos;
    }

    public void mostrarMedicamentos() {
        List<Medicamento> medicamentos = this.consultarTodos();
        for (Medicamento m : medicamentos) {
            System.out.println(m.toString());
        }
    }

    public void borrarPorId(Integer id) {
        try {
            medicamentoIDao.borrarPorId(id);
        } catch(SQLException e) {
            logger.error(e.getMessage());
        }
    }
}
