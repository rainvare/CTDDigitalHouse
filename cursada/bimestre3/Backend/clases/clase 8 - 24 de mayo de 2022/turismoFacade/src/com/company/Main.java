package com.company;

import java.time.LocalDate;

public class Main {

    public static void main(String[] args) {
        FacadeTurismo fachada = new FacadeTurismo();
        fachada.addVuelo(new Vuelo(LocalDate.of(2022, 8, 20), LocalDate.of(2022, 8, 22), "Rio de Janeiro"));
        fachada.addVuelo(new Vuelo(LocalDate.of(2022, 12, 23), LocalDate.of(2022, 12, 25), "Bariloche"));
        fachada.addVuelo(new Vuelo(LocalDate.of(2022, 6, 26), LocalDate.of(2022, 6, 28), "Ibiza"));

        fachada.addHotel(new Hotel(LocalDate.of(2022, 8, 20), LocalDate.of(2022, 8, 22), "Rio de Janeiro"));
        fachada.addHotel(new Hotel(LocalDate.of(2022, 12, 23), LocalDate.of(2022, 12, 25), "Bariloche"));
        fachada.addHotel(new Hotel(LocalDate.of(2022, 6, 26), LocalDate.of(2022, 6, 28), "Ibiza"));

        System.out.println(fachada.getHoteles());
        System.out.println(fachada.getVuelos());

        fachada.busqueda("Rio de Janeiro", LocalDate.of(2022, 12, 22));
    }
}
