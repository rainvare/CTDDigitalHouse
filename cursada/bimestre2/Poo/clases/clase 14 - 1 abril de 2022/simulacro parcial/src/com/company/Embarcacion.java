package com.company;

public abstract  class Embarcacion{
    private Capitan capitan;
    private Double precioBase;
    private Double valorAdicional;
    private Integer anioFabricacion;

    //Constructor
    public Embarcacion(Capitan capitan, Double precioBase, Double valorAdicional, Integer anioFabricacion){
        this.capitan = capitan;
        this.precioBase = precioBase;
        this.valorAdicional = valorAdicional;
        this.anioFabricacion = anioFabricacion;
    }

    //Metodos
    public Double montoAlquiler() {
        if (anioFabricacion > 2020) {
            return precioBase + valorAdicional;
        } else {
            return precioBase;
        }
    }


}