package com.company;

public class Main {
    public static void main(String[] args) throws EstacionException, Empresa.EstacionException {
        Empresa Empresa = new Empresa();

        Recorrido Recorrido1 = new Recorrido("Buenos Aires", "Bragado");
        Recorrido Recorrido2 = new Recorrido("Bragado", "Suipacha");

        Reserva Reserva1 = new Reserva("1822", Recorrido1, 8);
        Reserva Reserva2 = new Reserva("1539", Recorrido2, 2);

        Empresa.agregarReserva(Reserva1);
        Empresa.agregarReserva(Reserva2);

        System.out.println("La recaudación de la empresa fue de: " + Empresa.recaudacionTotal());

        System.out.println("La estación Bragado fue recorrida un total de: " + Empresa.cantVecesRecorrida("Bragado"));
    }
}

