package com.company;

public class Perro {
    private String nombre;
    private String raza;
    private Integer anioNacimiento;
    private Double peso;
    private Boolean tieneChip;
    private Boolean estaLastimado;
    private Boolean estaEnAdopcion;

    public Perro(String nombre, Integer anioNacimiento, Double peso, Boolean tieneChip, Boolean estaLastimado, Boolean estaEnAdopcion) {
        this.nombre = nombre;
        this.raza = "Mestizo";
        this.anioNacimiento = anioNacimiento;
        this.peso = peso;
        this.tieneChip = tieneChip;
        this.estaLastimado = estaLastimado;
        this.estaEnAdopcion = estaEnAdopcion;
    }

    public Perro(String nombre, String raza, Integer anioNacimiento, Double peso, Boolean tieneChip, Boolean estaLastimado, Boolean estaEnAdopcion) {
        this.nombre = nombre;
        this.raza = raza;
        this.anioNacimiento = anioNacimiento;
        this.peso = peso;
        this.tieneChip = tieneChip;
        this.estaLastimado = estaLastimado;
        this.estaEnAdopcion = estaEnAdopcion;
    }

    public Integer calcularEdad(Integer fechaActual) {
        return fechaActual - this.anioNacimiento;
    }

    public Boolean sePuedeAdoptar(Integer fechaActual) {
        if(calcularEdad(fechaActual)>5 && !estaLastimado){
            return true;
        } else {
            return false;
        }
    }

    public Boolean sePuedePerder(){
        if(this.tieneChip){
            return true;
        } else {
            return false;
        }
    }

    public Boolean getTieneChip() {
        return tieneChip;
    }

    public void setTieneChip(Boolean tieneChip) {
        this.tieneChip = tieneChip;
    }

    public Boolean getEstaLastimado() {
        return estaLastimado;
    }

    public void setEstaLastimado(Boolean estaLastimado) {
        this.estaLastimado = estaLastimado;
    }

    public Boolean getEstaEnAdopcion() {
        return estaEnAdopcion;
    }

    public void setEstaEnAdopcion(Boolean estaEnAdopcion) {
        this.estaEnAdopcion = estaEnAdopcion;
    }
}