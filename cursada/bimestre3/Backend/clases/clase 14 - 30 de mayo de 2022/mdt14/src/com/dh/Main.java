package com.dh;

import com.dh.dao.ConfiguracionJDBC;
import com.dh.dao.impl.DaoH2Medicamento;
import com.dh.model.Medicamento;
import com.dh.service.Farmacia;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import java.util.List;

public class Main {

    private static Logger logger = Logger.getLogger(Main.class);

    public static void main(String[] args) {

        PropertyConfigurator.configure("log4j.properties");

        try {
            Farmacia farmacia = new Farmacia(new DaoH2Medicamento(new ConfiguracionJDBC()));

            farmacia.insertarNuevo(new Medicamento(1, "1AB0", "Ibupirac", "Pfizer", 20, 599.99));
            farmacia.insertarNuevo(new Medicamento(2, "2AB0", "Nafazolina", "M&E", 2, 299.99));
            farmacia.insertarNuevo(new Medicamento(3, "3AB0", "Tirotricina", "Gramon Millet", 3, 399.99));

            farmacia.mostrarMedicamentos();

            farmacia.insertarNuevo(new Medicamento(4, "4AB0", "Carbocisteina", "Casasco", 9, 299.99));
            farmacia.insertarNuevo(new Medicamento(5, "5AB0", "Gramicidina", "Gramon Millet", 7, 499.99));

            System.out.println(farmacia.consultarPorId(3).toString());

            farmacia.borrarPorId(3);

            farmacia.mostrarMedicamentos();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
    }
}
