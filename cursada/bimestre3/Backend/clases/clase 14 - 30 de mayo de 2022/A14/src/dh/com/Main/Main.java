package dh.com.Main;

import dh.com.Main.dao.AvionDAOH2;
import dh.com.Main.entidades.Avion;
import dh.com.Main.servicios.AvionService;

public class Main {
    public static void main(String[] args) {
    Avion avion = new Avion();

    avion.setId(1L);
    avion.setModelo("JN4 “Jenny” 1918");
    avion.setMatricula("123reqr");
    avion.setMarca("Curtiss Aeroplane and Motor Company");
    avion.setFechaEntradaServicio("17/1/90");

        AvionService avionService = new AvionService();
        avionService.setAvionIDao(new AvionDAOH2());

    avionService.guardar(avion);
    }
}