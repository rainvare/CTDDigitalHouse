package com.dh.comidasrapidas.model;

public class Menu {
    private double precioBase;
    private int salsasAplicadas;
    private int juguetesIncluidos;

    public Menu(double precioBase) {
        this.precioBase = precioBase;
    }

    public double getPrecioBase() {
        return this.precioBase;
    }

    public int getSalsasAplicadas() {
        return this.salsasAplicadas;
    }

    public int getJuguetesIncluidos() {
        return juguetesIncluidos;
    }
}
