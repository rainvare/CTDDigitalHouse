package com.company;

import java.util.ArrayList;
import java.util.List;

public class ProgramaIntensivo extends OfertaAcademica {

    private Double descuento;
    private List<OfertaAcademica> ofertasAcademicas;

    public ProgramaIntensivo(String nombre, String descripcion, Double descuento) {
        super(nombre, descripcion);
        this.descuento = descuento;
        ofertasAcademicas = new ArrayList<>();
    }

    public void agregarOfertaAcademica(OfertaAcademica ofertaAcademica){
        ofertasAcademicas.add(ofertaAcademica);
    }

    @Override
    public Double calcularPrecio() {
        Double precioTotal = 0.0;
        for (OfertaAcademica ofertaAcademica : ofertasAcademicas) {
            precioTotal += ofertaAcademica.calcularPrecio();
        }
        return precioTotal - (precioTotal * descuento);
    }
}
