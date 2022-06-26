package com.dh.dao;

import com.dh.dao.impl.DaoH2Medicamento;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConfiguracionJDBC {

    private String jdbcDriver;
    private String dbUrl;
    private String nombreUsuario;
    private String contrasenia;
    private Logger logger = Logger.getLogger(ConfiguracionJDBC.class);

    public ConfiguracionJDBC() {
        logger.debug("Instanciando ConfiguracionJDBC con valores por defecto. Driver: H2");
        this.jdbcDriver = "org.h2.Driver";
        this.dbUrl = "jdbc:h2:mem:medicamentos;DB_CLOSE_DELAY=-1;INIT=RUNSCRIPT FROM 'create.sql';";
        this.nombreUsuario = "sa";
        this.contrasenia = "sa";
    }

    public ConfiguracionJDBC(String jdbcDriver, String dbUrl, String nombreUsuario, String contrasenia) {
        logger.debug("Instanciando ConfiguracionJDBC con valores recibidos por parámetro");
        this.jdbcDriver = jdbcDriver;
        this.dbUrl = dbUrl;
        this.nombreUsuario = nombreUsuario;
        this.contrasenia = contrasenia;
    }

    public Connection contectarConBD() {
        logger.debug("Creando conexión con la base de datos");
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(dbUrl, nombreUsuario, contrasenia);
        } catch (SQLException e) {
            logger.error(e.getMessage());
        }
        return conexion;
    }
}
