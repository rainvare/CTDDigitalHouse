package test.com.dh.dao;

import com.dh.dao.ConfiguracionJDBC;
import com.dh.dao.impl.DaoH2Medicamento;
import com.dh.model.Medicamento;
import org.apache.log4j.PropertyConfigurator;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class DaoMedicamentoH2Test {

    private final DaoH2Medicamento daoH2Medicamento = new DaoH2Medicamento(new ConfiguracionJDBC());
    private final Medicamento ibupirac = new Medicamento(1, "1AB0", "Ibupirac", "Pfizer", 20, 599.99);
    private final Medicamento nafazolina = new Medicamento(2, "2AB0", "Nafazolina", "M&E", 2, 299.99);
    private final Medicamento tirotricina = new Medicamento(3, "3AB0", "Tirotricina", "Gramon Millet", 3, 399.99);
    private final Medicamento carbocisteina = new Medicamento(4, "4AB0", "Carbocisteina", "Casasco", 9, 299.99);
    private final Medicamento gramicidina = new Medicamento(5, "5AB0", "Gramicidina", "Gramon Millet", 7, 499.99);

    private void agregarDatos() throws SQLException {
        daoH2Medicamento.insertarNuevo(ibupirac);
        daoH2Medicamento.insertarNuevo(nafazolina);
        daoH2Medicamento.insertarNuevo(tirotricina);
        daoH2Medicamento.insertarNuevo(carbocisteina);
        daoH2Medicamento.insertarNuevo(gramicidina);
    }

    @BeforeAll
    public static void init() {
        PropertyConfigurator.configure("log4j.properties");
    }

    @BeforeEach
    public void resetearDao() throws Exception {
        daoH2Medicamento.borrarTodos();
    }

    public DaoMedicamentoH2Test() throws Exception {}

    @Test
    public void test01DaoH2MedicametoNoPuedeInstanciarseConConfiguracionNula() {
        assertThrows(Exception.class, () -> new DaoH2Medicamento(null));
    }

    @Test
    public void test02GuardarMedicamento() throws SQLException {
        Medicamento medicamento = new Medicamento(1, "1AB0", "Ibupirac", "Pfizer", 20, 599.99);
        assertTrue(daoH2Medicamento.insertarNuevo(medicamento) > 0);
    }

    @Test
    public void test03ListarTodos() throws SQLException {
        agregarDatos();
        List<Medicamento> medicamentos = daoH2Medicamento.consultarTodos();
        assertEquals(5, medicamentos.size());
    }

    @Test
    public void test04BorrarTodos() throws SQLException {
        agregarDatos();
        daoH2Medicamento.borrarTodos();
        List<Medicamento> medicamentos = daoH2Medicamento.consultarTodos();
        assertEquals(0, medicamentos.size());
    }

    @Test
    public void test05BorrarPorId() throws SQLException {
        daoH2Medicamento.insertarNuevo(ibupirac);
        daoH2Medicamento.borrarPorId(ibupirac.getId());
        List<Medicamento> medicamentos = daoH2Medicamento.consultarTodos();
        assertEquals(0, medicamentos.size());
    }

    @Test
    public void test06ConsultarPorId() throws SQLException {
        daoH2Medicamento.insertarNuevo(ibupirac);
        Medicamento ibupiracObtenido = daoH2Medicamento.consultarPorId(ibupirac.getId());
        assertEquals(ibupirac, ibupiracObtenido);
    }
}
