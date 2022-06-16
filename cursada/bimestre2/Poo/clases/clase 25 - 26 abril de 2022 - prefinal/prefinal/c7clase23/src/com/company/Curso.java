package com.company;

public class Curso extends OfertaAcademica {

    private Double precioPorHora;
    private Double horasMensuales;
    private Double duracionMeses;

    public Curso(String nombre, String descripcion, Double precioPorHora, Double horasMensuales, Double duracionMeses) {
        super(nombre, descripcion);
        this.precioPorHora = precioPorHora;
        this.horasMensuales = horasMensuales;
        this.duracionMeses = duracionMeses;
    }

    @Override
    public Double calcularPrecio() {
        return precioPorHora * horasMensuales * duracionMeses;
    }
}
