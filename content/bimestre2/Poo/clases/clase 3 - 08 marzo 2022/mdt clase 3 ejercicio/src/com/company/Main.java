package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        // pedir el nombre del perro
        System.out.println("ingrese nombre: ");
        String nombre = scanner.nextLine();
        //pedir cantidad de comida
        System.out.println("cuanta comida requiere: ");
        Double comidaRequerida = scanner.nextDouble();
        // crear funcion cuantosPaquetes
        Integer cantidadPaquetes = cuantosPaquetes(comidaRequerida);

        System.out.println(nombre + " precisa " + cantidadPaquetes + " paquetes");

    }


        public static Integer cuantosPaquetes (Double comidaTotalRequerida) {

            Scanner scanner = new Scanner(System.in);
            Double comidaTotalEnPaquetes = 0.0;
            Integer cantidadDePaquetes = 0;
            while (comidaTotalRequerida > comidaTotalEnPaquetes) {
                System.out.println("comida en paquete: ");
                Double cantidadPaquete = scanner.nextDouble();
                //comidaTotalEnPaquetes = comidaTotalEnPaquetes + cantidadPaquete;
                comidaTotalEnPaquetes += cantidadPaquete;
                cantidadDePaquetes++;

            }

            return cantidadDePaquetes;


        }




}
