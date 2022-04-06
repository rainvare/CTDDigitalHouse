package com.company;

public class Main {

    public static void main(String[] args) {
        Capitan capitan_1 = new Capitan("Abel", "Perez", "NAV0001A");
        Capitan capitan_2 = new Capitan("Agustin", "Garcia", "NAV0002A");
        Yate yate_1 = new Yate(capitan_1,  12000.00, 800.00, 2021, 3);
        Yate yate_2 = new Yate(capitan_2,  18000.00, 1200.00, 2020, 5);

        System.out.println(yate_1.montoAlquiler());
        System.out.println(yate_2.montoAlquiler());
        System.out.println(yate_2.compareTo(yate_1));
    }


}