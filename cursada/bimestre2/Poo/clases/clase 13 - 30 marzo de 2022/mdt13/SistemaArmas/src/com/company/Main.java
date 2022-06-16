package com.company;

public class Main {

    public static void main(String[] args) {
        System.out.println("Tito es pesado. Su energía es:");
        Robot tito=new RobotPesado(80,500.0); //aqui aplico vinculacion dinámica
        System.out.println(tito.getEnergia());
        System.out.println(tito.mostrar());
        System.out.println("Tito ahora es liviano. Su energía es:");
	    tito=new RobotLiviano(100,66.6);
        System.out.println(tito.getEnergia());
        System.out.println(tito.mostrar());
        System.out.println("Tito ataca");
        ((RobotLiviano)tito).atacar();
        System.out.println(tito.mostrar());
        System.out.println("Tito se defiende dos veces");
        ((RobotLiviano)tito).defender();
        ((RobotLiviano)tito).defender();
        System.out.println(tito.mostrar());
        System.out.println("Tito vuela");
        ((RobotLiviano)tito).volar();
        System.out.println(tito.mostrar());
        System.out.println("Tito vuela 2 veces mas");
        ((RobotLiviano)tito).volar();
        ((RobotLiviano)tito).volar();
        System.out.println(tito.toString());
        System.out.println("Comparamos Robo con Tito");
        Robot robo=new RobotPesado(80,500.0);
        System.out.println(robo.toString());
        System.out.println(robo.compareTo(tito));
        System.out.println("Comparamos Tito con Robo");
        System.out.println(tito.compareTo(robo));
        System.out.println("Comparamos Tito con Tito");
        System.out.println(tito.compareTo(tito));
    }
}
