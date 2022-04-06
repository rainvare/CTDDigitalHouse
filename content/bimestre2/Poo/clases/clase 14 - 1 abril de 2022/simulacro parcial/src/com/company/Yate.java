package com.company;

public class Yate extends Embarcacion implements Comparable{
    private  Integer cantidadCamarotes;

    //Constructor
    public Yate(Capitan capitan, Double precioBase, Double valorAdicional, Integer anioFabricacion, Integer cantidadCamarotes) {
        super(capitan, precioBase, valorAdicional, anioFabricacion);
        this.cantidadCamarotes = cantidadCamarotes;
    }

    //Un Yate es más grande que otro si tiene más camarotes
    @Override
    public int compareTo(Object o){
        Yate otroYate = (Yate) o;
        return this.cantidadCamarotes - otroYate.cantidadCamarotes;
    }


}