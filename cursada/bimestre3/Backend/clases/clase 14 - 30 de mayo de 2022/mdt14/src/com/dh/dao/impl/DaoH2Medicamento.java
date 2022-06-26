package com.dh.dao.impl;

import com.dh.dao.GeneradorDeSentenciasMedicamentos;
import com.dh.dao.ConfiguracionJDBC;
import com.dh.dao.IDao;
import com.dh.model.Medicamento;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoH2Medicamento implements IDao<Medicamento> {

    private ConfiguracionJDBC configuracionJDBC;
    private Logger logger = Logger.getLogger(DaoH2Medicamento.class);

    public DaoH2Medicamento(ConfiguracionJDBC configuracionJDBC) throws Exception {
        if (configuracionJDBC == null) {
            throw new Exception("¡Sin configuración de JDBC no hay DAO!");
        }
        this.configuracionJDBC = configuracionJDBC;
    }

    @Override
    public Medicamento consultarPorId(Integer id) throws SQLException {
        logger.debug("Iniciando método 'consultarPorId()'");
        Connection connection = configuracionJDBC.contectarConBD();
        PreparedStatement preparedStatement = connection.prepareStatement(GeneradorDeSentenciasMedicamentos.generarSelectPorId());
        preparedStatement.setInt(1, id);
        ResultSet result = preparedStatement.executeQuery();
        Medicamento medicamento = new Medicamento();

        while (result.next()) {
            medicamento.setId(result.getInt("id"));
            medicamento.setCodigo(result.getString("codigo"));
            medicamento.setNombre(result.getString("nombre"));
            medicamento.setLaboratorio(result.getString("laboratorio"));
            medicamento.setCantidad(result.getInt("cantidad"));
            medicamento.setPrecio(result.getDouble("precio"));
        }

        connection.close();
        logger.debug("Terminó la ejecución del método 'consultarPorId()' con éxito");
        return medicamento;
    }

    @Override
    public Integer insertarNuevo(Medicamento medicamento) throws SQLException {
        logger.debug("Iniciando método 'insertarNuevo()'");
        Connection connection = configuracionJDBC.contectarConBD();
        PreparedStatement preparedStatement = connection.prepareStatement(GeneradorDeSentenciasMedicamentos.generarInsert());
        preparedStatement.setInt(1, medicamento.getId());
        preparedStatement.setString(2, medicamento.getCodigo());
        preparedStatement.setString(3, medicamento.getNombre());
        preparedStatement.setString(4, medicamento.getLaboratorio());
        preparedStatement.setInt(5, medicamento.getCantidad());
        preparedStatement.setDouble(6, medicamento.getPrecio());
        Integer count = preparedStatement.executeUpdate();
        connection.close();
        logger.debug("Terminó la ejecución del método 'insertarNuevo()' con éxito");
        return count;
    }

    @Override
    public void borrarTodos() throws SQLException {
        logger.debug("Iniciando método 'borrarTodos()'");
        Connection connection = configuracionJDBC.contectarConBD();
        PreparedStatement preparedStatement = connection.prepareStatement(GeneradorDeSentenciasMedicamentos.generarDeleteAll());
        preparedStatement.execute();
        connection.close();
        logger.debug("Terminó la ejecución del método 'borrarTodos()' con éxito");
    }

    @Override
    public void borrarPorId(Integer id) throws SQLException {
        logger.debug("Iniciando método 'borrarPorId()'");
        Connection connection = configuracionJDBC.contectarConBD();
        PreparedStatement preparedStatement = connection.prepareStatement(GeneradorDeSentenciasMedicamentos.generarDeletePorId());
        preparedStatement.setInt(1, id);
        preparedStatement.execute();
        connection.close();
        logger.debug("Terminó la ejecución del método 'borrarPorId()' con éxito");

    }

    @Override
    public List<Medicamento> consultarTodos() throws SQLException {
        logger.debug("Iniciando método 'consultarTodos()'");
        Connection connection = configuracionJDBC.contectarConBD();
        PreparedStatement preparedStatement = connection.prepareStatement(GeneradorDeSentenciasMedicamentos.generarSelectAll());
        ResultSet results = preparedStatement.executeQuery();
        List<Medicamento> medicamentos = new ArrayList<>();

        while(results.next()) {
            Medicamento medicamento = new Medicamento(
                    results.getInt("id"),
                    results.getString("codigo"),
                    results.getString("nombre"),
                    results.getString("laboratorio"),
                    results.getInt("cantidad"),
                    results.getDouble("precio")
            );
            medicamentos.add(medicamento);
        }
        logger.debug("Terminó la ejecución del método 'consultarTodos()' con éxito");
        return medicamentos;
    }
}
