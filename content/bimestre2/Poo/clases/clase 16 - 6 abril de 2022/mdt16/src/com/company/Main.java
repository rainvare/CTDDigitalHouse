package com.company;

public class Main {

    public static void main(String[] args) {
        // write your code here
        Puerto puerto = new Puerto();

        Contenedor contenedor1 = new Contenedor(40, "China", true);
        Contenedor contenedor2 = new Contenedor(15, "Rusia", true);
        Contenedor contenedor3 = new Contenedor(65, "Canadá", false);
        Contenedor contenedor4 = new Contenedor(298, "Desconocida", false);

        puerto.agregarContenedor(contenedor1);
        puerto.agregarContenedor(contenedor2);
        puerto.agregarContenedor(contenedor3);
        puerto.agregarContenedor(contenedor4);

        puerto.mostrarOrdenadosporId();

        System.out.println(puerto.calcularContenedoresPeligrosos());


    }
}