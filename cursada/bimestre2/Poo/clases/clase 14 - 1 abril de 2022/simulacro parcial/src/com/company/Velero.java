package com.company;

public class Velero extends Embarcacion {
    private Integer cantidadMastiles;

    //Constructor
    public Velero(Capitan capitan, Double precioBase, Double valorAdicional, Integer anioFabricacion, Integer cantidadMastiles){
        super(capitan, precioBase, valorAdicional, anioFabricacion);
        this.cantidadMastiles = cantidadMastiles;
    }

    //Métodos
    public Boolean esGrande() {
        return (cantidadMastiles > 4);
    }


}