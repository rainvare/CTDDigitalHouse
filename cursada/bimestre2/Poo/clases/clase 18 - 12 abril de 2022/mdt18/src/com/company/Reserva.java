package com.company;


public class Reserva {

    private String codigo;
    private Recorrido recorrido;
    private int cantPersonas;

    public Reserva(String codigo, Recorrido recorrido, int cantPersonas) {
        this.codigo = codigo;
        this.recorrido = recorrido;
        this.cantPersonas = cantPersonas;
    }

    public double calcularPrecio() {
        double precio = cantPersonas * 50;
        if(recorrido.tieneDescuento()) {
            return precio * 0.8;
        }
        return precio;
    }

    public Recorrido getRecorrido() {
        return recorrido;
    }

    public int getCantPersonas() {
        return cantPersonas;
    }
}
