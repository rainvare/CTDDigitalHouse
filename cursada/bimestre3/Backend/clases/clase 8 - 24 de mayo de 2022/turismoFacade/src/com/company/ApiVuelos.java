package com.company;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ApiVuelos {

    private List<Vuelo> vuelos;

    public ApiVuelos() {
        this.vuelos = new ArrayList<>();
    }

    public List<Vuelo> getVuelos() {
        return vuelos;
    }

    public Vuelo buscarVuelo(String destino, LocalDate fecha) {

        Vuelo vuelo1 = null;
        for (Vuelo vuelo : vuelos) {
            if (vuelo.getDestino().compareToIgnoreCase(destino) != 0) {
                System.out.println("No hay vuelos disponibles para ese destino");
            } else if (!vuelo.getSalida().isEqual(fecha)) {
                System.out.println("No hay vuelos disponibles para esa fecha");
            } else {
                vuelo1 = vuelo;
            }
        }
        return vuelo1;
    }
}
