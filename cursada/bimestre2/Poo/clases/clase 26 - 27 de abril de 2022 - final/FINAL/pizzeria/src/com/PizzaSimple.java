package com;

public class PizzaSimple extends Pizza{
    private Double precioBase;
    private String tamanio;

    public PizzaSimple(String nombre, String descripcion, Double precioBase, String tamanio) {
        super(nombre, descripcion);
        this.precioBase = precioBase;
        this.tamanio = tamanio;
    }

//métodos
    @Override
    public Double calcularPrecio() {
        if(tamanio.equals("Grande")){
            return precioBase*2;
        }
        else {
            return precioBase;
        }
    }


}
