package com.company;

import java.util.ArrayList;
import java.util.List;

public class Instituto {

    private List<OfertaAcademica> ofertasAcademicas;

    public Instituto() {
        ofertasAcademicas = new ArrayList<>();
    }



    public void agregarOfertaAcademica(String codigo){
        try {
            ofertasAcademicas.add(OfertaAcademicaFactory.getInstance().generarOfertaAcademica(codigo));
        } catch (OfertaAcademicaException e) {
            System.out.println(e.getMessage());
        }
    }

    public void generarInforme(){
        for (OfertaAcademica ofertaAcademica : ofertasAcademicas) {
            System.out.println(ofertaAcademica);
            //       System.out.println("Nombre" + ofertaAcademica.getNombre() + " Precio: " + ofertaAcademica.calcularPrecio());
        }
    }
}
