package com.dh.clinica.repository.impl;

import com.dh.clinica.repository.IDao;
import com.dh.clinica.repository.configuracion.ConfiguracionJDBC;
import com.dh.clinica.model.Odontologo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;
import java.util.Optional;
@Repository
public class OdontologoDaoH2 implements IDao<Odontologo> {

    private final ConfiguracionJDBC configuracionJDBC;
    final static Logger log = Logger.getLogger(OdontologoDaoH2.class);


    public OdontologoDaoH2(ConfiguracionJDBC configuracionJDBC) {
        this.configuracionJDBC = configuracionJDBC;
    }

    @Override
    public Odontologo guardar(Odontologo odontologo) {
        log.debug("Registrando nuevo odontologo : "+ odontologo.toString());
        Connection connection = configuracionJDBC.conectarConBaseDeDatos();
        Statement stmt = null;
        String query = String.format("INSERT INTO odontologos(nombre,apellido,matricula) VALUES('%s','%s','%s')", odontologo.getNombre(), odontologo.getApellido(),
                odontologo.getMatricula());
        try {
            stmt = connection.createStatement();
            stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
            ResultSet keys = stmt.getGeneratedKeys();
            if (keys.next())
                odontologo.setId(keys.getInt(1));
            stmt.close();
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return odontologo;
    }

    @Override
    public Optional<Odontologo> buscar(Integer id) {
        log.debug("Buscando odontologo con id : "+id);
        Connection connection = configuracionJDBC.conectarConBaseDeDatos();
        Statement stmt = null;
        String query = String.format("SELECT id,nombre,apellido,matricula FROM odontologos where id = '%s'", id);
        Odontologo odontologo = null;
        try {
            stmt = connection.createStatement();
            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {
                odontologo = crearObjetoOdontologo(result);
            }

            stmt.close();
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return odontologo != null ? Optional.of(odontologo) : Optional.empty();
    }

    @Override
    public void eliminar(Integer id) {
        log.debug("Borrand odontologo con id : "+id);
        Connection connection = configuracionJDBC.conectarConBaseDeDatos();
        Statement stmt = null;
        String query = String.format("DELETE FROM odontologos where id = %s", id);
        execute(connection, query);

    }

    @Override
    public List<Odontologo> buscarTodos() {
        log.debug("Buscando todos los odontologos");
        Connection connection = configuracionJDBC.conectarConBaseDeDatos();
        Statement stmt = null;
        String query = "SELECT *  FROM odontologos";
        List<Odontologo> odontologos = new ArrayList<>();
        try {
            stmt = connection.createStatement();
            ResultSet result = stmt.executeQuery(query);
            while (result.next()) {

                odontologos.add(crearObjetoOdontologo(result));

            }

            stmt.close();
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return odontologos;
    }

    @Override
    public Odontologo actualizar(Odontologo odontologo) {
        Connection connection = configuracionJDBC.conectarConBaseDeDatos();

        String query = String.format("UPDATE odontologos SET nombre = '%s', apellido = '%s',matricula = '%s'  WHERE id = '%s'",
               odontologo.getNombre(),odontologo.getApellido(),odontologo.getMatricula(),odontologo.getId());
        execute(connection, query);
        return odontologo;
    }

    private Odontologo crearObjetoOdontologo(ResultSet resultSet) throws SQLException {

        return new Odontologo(resultSet.getInt("id"), resultSet.getString("nombre"), resultSet.getString("apellido"), resultSet.getInt("matricula"));
    }
    private void execute(Connection connection, String query) {
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
