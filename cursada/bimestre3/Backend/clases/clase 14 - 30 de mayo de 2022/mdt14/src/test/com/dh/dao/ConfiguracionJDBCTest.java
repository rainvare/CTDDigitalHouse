package test.com.dh.dao;

import com.dh.dao.ConfiguracionJDBC;
import org.apache.log4j.PropertyConfigurator;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

public class ConfiguracionJDBCTest {

    private ConfiguracionJDBC configuracionJDBC = null;
    Connection conexion = null;

    @BeforeAll
    public static void init() {
        PropertyConfigurator.configure("log4j.properties");
    }

    @BeforeEach
    public void reset() {
        conexion = null;
        configuracionJDBC = null;
    }

    @Test
    public void test01ConectarConBDRetornaUnObjetoConnection() {
        configuracionJDBC = new ConfiguracionJDBC();
        conexion = configuracionJDBC.contectarConBD();
        assertNotNull(conexion);
    }

    @Test
    public void test02ConectarConBDRetornaNullSiOcurreUnError() {
        configuracionJDBC = new ConfiguracionJDBC(null, null, null, null);
        conexion = configuracionJDBC.contectarConBD();
        assertNull(conexion);
    }
}
