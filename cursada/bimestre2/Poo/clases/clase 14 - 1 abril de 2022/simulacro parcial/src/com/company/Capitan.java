package com.company;

public class Capitan {
    private String nombre;
    private String apellido;
    private String matriculaNavegacion;

    //Constructor
    public Capitan(String nombre, String apellido, String matriculaNavegacion){
        this.nombre = nombre;
        this.apellido = apellido;
        this.matriculaNavegacion = matriculaNavegacion;
    }

    //Metodos
    public void navegarEmbarcacion(){
        System.out.println("Estoy navegando");
    }


}