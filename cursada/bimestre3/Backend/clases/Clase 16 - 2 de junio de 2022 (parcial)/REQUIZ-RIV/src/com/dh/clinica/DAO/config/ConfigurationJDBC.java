package com.dh.clinica.DAO.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

public class ConfigurationJDBC {

    /* Atributos */

    private String jdbcDriver;
    private String dbUrl;
    private String nombreUsuario;
    private String contrasenaUsuario;
    private Connection connection;

    private static final Logger logger = Logger.getLogger(ConfigurationJDBC.class);

    /* Constructores */

    public ConfigurationJDBC(String jdbcDriver, String dbUrl, String nombreUsuario, String contrasenaUsuario) {
        this.jdbcDriver = jdbcDriver;
        this.dbUrl = dbUrl;
        this.nombreUsuario = nombreUsuario;
        this.contrasenaUsuario = contrasenaUsuario;
    }

    public ConfigurationJDBC() {
        String PathFile = System.getProperty("user.dir").replace("\\", "/") + "/create.sql";

        this.jdbcDriver = "org.h2.Driver";

        this.dbUrl =  "jdbc:h2:tcp://localhost/~/test;" + "DB_CLOSE_DELAY=-1;" + "INIT=RUNSCRIPT FROM '" + PathFile + "';";
        this.nombreUsuario = "sa";
        this.contrasenaUsuario = "";


    }

    /* Métodos */

    public Connection connectionDB() {

        try {
            connection = DriverManager.getConnection(dbUrl, nombreUsuario, contrasenaUsuario);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        logger.debug("Se establece la conexión con la BBDD");
        return connection;
    }


    public Statement statementDB(){

        Connection connection = connectionDB();
        Statement statement = null;

        try{
            statement = connection.createStatement();
        }catch(SQLException e){

            logger.error("Error " + e.getMessage());
        }
        logger.debug("Statement exitoso");
        return statement;

    }
}
