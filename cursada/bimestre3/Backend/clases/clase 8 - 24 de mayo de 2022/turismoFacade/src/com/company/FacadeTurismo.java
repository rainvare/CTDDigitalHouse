package com.company;

import java.time.LocalDate;
import java.util.List;

public class FacadeTurismo {

    private ApiHoteles hoteles;
    private ApiVuelos vuelos;

    public FacadeTurismo() {
        this.hoteles = new ApiHoteles();
        this.vuelos = new ApiVuelos();
    }

    public void addHotel(Hotel hotel){
        hoteles.getHoteles().add(hotel);
    }

    public List<Hotel> getHoteles(){
        return hoteles.getHoteles();
    }

    public void addVuelo(Vuelo vuelo){
        vuelos.getVuelos().add(vuelo);
    }

    public List<Vuelo> getVuelos(){
        return vuelos.getVuelos();
    }

    public void busqueda(String destino, LocalDate fecha){
        System.out.println("HOTELES DISPONIBLES:");
        hoteles.buscarHotel(destino, fecha);
        System.out.println(" ");
        System.out.println("VUELOS DISPONIBLES");
        System.out.println(vuelos.buscarVuelo(destino, fecha));
    }
}
