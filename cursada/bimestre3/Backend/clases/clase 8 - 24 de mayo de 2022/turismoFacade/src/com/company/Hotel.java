package com.company;

import java.time.LocalDate;

public class Hotel {
    private LocalDate salida;
    private LocalDate ingreso;
    private String ciudad;

    public Hotel(LocalDate salida, LocalDate ingreso, String ciudad) {
        this.salida = salida;
        this.ingreso = ingreso;
        this.ciudad = ciudad;
    }

    public LocalDate getSalida() {
        return salida;
    }

    public void setSalida(LocalDate salida) {
        this.salida = salida;
    }

    public LocalDate getIngreso() {
        return ingreso;
    }

    public void setIngreso(LocalDate ingreso) {
        this.ingreso = ingreso;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "salida=" + salida +
                ", ingreso=" + ingreso +
                ", ciudad='" + ciudad + '\'' +
                '}';
    }
}
