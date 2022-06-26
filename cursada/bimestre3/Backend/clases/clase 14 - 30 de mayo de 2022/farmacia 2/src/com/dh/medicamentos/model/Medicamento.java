package com.dh.medicamentos.model;

public class Medicamento {
    private Integer id;
    private String nombre;
    private String laboratorio;
    private Integer cantidad;
    private Double precio;

    public Medicamento(Integer id, String nombre, String laboratorio, Integer cantidad, Double precio) {
        this.id = id;
        this.nombre = nombre;
        this.laboratorio = laboratorio;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public Medicamento(String nombre, String laboratorio, Integer cantidad, Double precio) {
        this.nombre = nombre;
        this.laboratorio = laboratorio;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLaboratorio() {
        return laboratorio;
    }

    public void setLaboratorio(String laboratorio) {
        this.laboratorio = laboratorio;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "Medicamento{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", laboratorio='" + laboratorio + '\'' +
                ", cantidad='" + cantidad + '\'' +
                ", precio=" + precio +
                '}';
    }
}
