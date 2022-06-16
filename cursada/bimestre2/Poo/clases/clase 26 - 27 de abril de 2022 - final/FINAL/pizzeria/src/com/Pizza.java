package com;

public abstract class Pizza{
    private String nombre;
    private String descripcion;

    //constructor
    public Pizza(String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    //getter
    public String getNombre() {
        return nombre;
    }

    //métodos abstractos
    public abstract Double calcularPrecio();

    public String toString() {
        return "La pizza " + nombre + " tiene un precio de " + calcularPrecio();
    }

}
