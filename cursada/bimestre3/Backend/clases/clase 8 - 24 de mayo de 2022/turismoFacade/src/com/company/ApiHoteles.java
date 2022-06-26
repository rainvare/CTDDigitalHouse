package com.company;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ApiHoteles {

    private List<Hotel> hoteles;

    public ApiHoteles() {
        this.hoteles = new ArrayList<>();
    }

    public List<Hotel> getHoteles() {
        return hoteles;
    }

    public Hotel buscarHotel(String ciudad, LocalDate fecha) {
        Hotel hotelReturn = null;

        for (Hotel hotel : hoteles) {
            if (hotel.getCiudad().compareToIgnoreCase(ciudad) != 0){
                System.out.println("No hay hoteles disponibles para ese destino");
            } else if (!hotel.getSalida().isEqual(fecha)){
                System.out.println("No hay hoteles disponibles para esa fecha");
            } else hotelReturn = hotel;
        }
        System.out.println(hotelReturn);
        return hotelReturn;
    }
}