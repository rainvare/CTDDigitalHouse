package com.dh.ecommerce.model;

public class Tarjeta {

    private String numerosFrente;
    private String codSeguridad;
    private String fechaVencimiento;

    public Tarjeta(String numerosFrente, String codSeguridad, String fechaVencimiento) {
        this.numerosFrente = numerosFrente;
        this.codSeguridad = codSeguridad;
        this.fechaVencimiento = fechaVencimiento;
    }

    public String getNumerosFrente() {
        return numerosFrente;
    }

    public void setNumerosFrente(String numerosFrente) {
        this.numerosFrente = numerosFrente;
    }

    public String getCodSeguridad() {
        return codSeguridad;
    }

    public void setCodSeguridad(String codSeguridad) {
        this.codSeguridad = codSeguridad;
    }

    public String getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(String fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    @Override
    public String toString() {
        return "Tarjeta{" +
                "numerosFrente='" + numerosFrente + '\'' +
                ", codSeguridad='" + codSeguridad + '\'' +
                ", fechaVencimiento='" + fechaVencimiento + '\'' +
                '}';
    }
}
