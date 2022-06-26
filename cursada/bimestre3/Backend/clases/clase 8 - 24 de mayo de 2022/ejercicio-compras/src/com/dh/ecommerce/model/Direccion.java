package com.dh.ecommerce.model;

public class Direccion {
    private String calle;
    private String nro;
    private String codigoPostal;
    private String barrio;
    private String ciudad;
    public Direccion(String calle, String nro, String codigoPostal, String barrio, String ciudad) {
        this.calle = calle;
        this.nro = nro;
        this.codigoPostal = codigoPostal;
        this.barrio = barrio;
        this.ciudad = ciudad;
    }
    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getNro() {
        return nro;
    }

    public void setNro(String nro) {
        this.nro = nro;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getBarrio() {
        return barrio;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }



    @Override
    public String toString() {
        return "Direccion{" +
                "calle='" + calle + '\'' +
                ", nro='" + nro + '\'' +
                ", codigoPostal='" + codigoPostal + '\'' +
                ", barrio='" + barrio + '\'' +
                ", ciudad='" + ciudad + '\'' +
                '}';
    }
}
