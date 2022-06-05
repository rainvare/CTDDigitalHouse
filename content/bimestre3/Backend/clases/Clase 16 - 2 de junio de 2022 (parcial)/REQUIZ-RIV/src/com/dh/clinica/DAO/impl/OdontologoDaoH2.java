package com.dh.clinica.DAO.impl;

import com.dh.clinica.DAO.IDao;
import com.dh.clinica.DAO.config.ConfigurationJDBC;
import com.dh.clinica.model.Odontologo;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;


public class OdontologoDaoH2 implements IDao<Odontologo> {

    /* Atributos de mi modelo DAO*/

    private ConfigurationJDBC configurationJDBC;
    private static final Logger logger = Logger.getLogger(String.valueOf(OdontologoDaoH2.class));

    /* Getters y Setters */

    public ConfigurationJDBC getConfigurationJDBC() {
        return configurationJDBC;
    }

    public void setConfigurationJDBC(ConfigurationJDBC configurationJDBC) {
        this.configurationJDBC = configurationJDBC;
    }


    /* Constructor de mi modelo */

    public OdontologoDaoH2(ConfigurationJDBC configurationJDBC) {
        this.configurationJDBC = configurationJDBC;
    }

    /* Métodos */

    @Override
    public void vaciar() {

        Connection connection = configurationJDBC.connectionDB();
        Statement statement = configurationJDBC.statementDB();

        String query = "TRUNCATE TABLE ODONTOLOGOS RESTART IDENTITY";

        try {
            statement.executeUpdate(query);
            logger.debug("La Base de datos está vacía");
        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Error: " + e.getMessage());
        }

    }

    @Override
    public Odontologo guardar(Odontologo odontologo) {
        Connection connection = configurationJDBC.connectionDB();
        Statement statement = configurationJDBC.statementDB();

        String query = "INSERT INTO ODONTOLOGOS (NOMBRE, APELLIDO, MATRICULA) VALUES ('" + odontologo.getNombre() +  "', '" + odontologo.getApellido() + "', " + odontologo.getMatricula() + ");";

        try{
            statement.executeUpdate(query,Statement.RETURN_GENERATED_KEYS);
            ResultSet IdKey = statement.getGeneratedKeys();

            if(IdKey.next()){
                odontologo.setID(IdKey.getInt(1));
                logger.debug("El odontologo ID: " + IdKey.getInt(1) + " se ha agregado a la BBDD");
            }

            statement.close();
            connection.close();

        }catch(SQLException e){
            e.printStackTrace();
            logger.error("Error: " + e.getMessage());
        }

        return odontologo;
    }

    @Override
    public Odontologo buscar(int id) {

        Connection connection = configurationJDBC.connectionDB();
        Statement statement = configurationJDBC.statementDB();
        Odontologo odontologo = null;

        String query = "SELECT * FROM Odontologos WHERE ID = " + id + ";";

        try{
            ResultSet resultSet = statement.executeQuery(query);
            logger.debug("El odontologo ID: " + id + " ha sido encontrado");

            while(resultSet.next()){
                odontologo = new Odontologo(resultSet.getString(2),resultSet.getString(3), resultSet.getInt(4));
                odontologo.setID(resultSet.getInt(1));
                System.out.println(resultSet.getInt(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3) + " " + resultSet.getInt(4));
            }

        }catch(SQLException e){
            e.printStackTrace();
            logger.error("Error: " + e.getMessage());
        }
        return odontologo;

    }

    @Override
    public List<Odontologo> listarTodos() {

        Connection connection = configurationJDBC.connectionDB();
        Statement statement = configurationJDBC.statementDB();

        String query = "SELECT * FROM Odontologos;";
        List<Odontologo> odontologos = new ArrayList<>();

        try{
            ResultSet resultSet = statement.executeQuery(query);
            logger.debug("odontologo registrado en el sistema");

            while(resultSet.next()){
                Odontologo odontologo = new Odontologo(resultSet.getString(2),resultSet.getString(3),resultSet.getInt(4));
                odontologo.setID(resultSet.getInt(1));
                odontologos.add(odontologo);
            }

        }catch (SQLException e){
            e.printStackTrace();
            logger.error("Error: " + e.getMessage()+ " -->");
        }

        return odontologos;
    }
}
