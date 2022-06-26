package com.dh.model;

import java.util.Objects;

public class Medicamento {

    private Integer id;
    private String codigo;
    private String nombre;
    private String laboratorio;
    private Integer cantidad;
    private Double precio;

    public Medicamento() {}

    public Medicamento(Integer id, String codigo, String nombre, String laboratorio, Integer cantidad, Double precio) {
        this.id = id;
        this.codigo = codigo;
        this.nombre = nombre;
        this.laboratorio = laboratorio;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Medicamento that = (Medicamento) o;
        return id.equals(that.id) && codigo.equals(that.codigo) && nombre.equals(that.nombre) && laboratorio.equals(that.laboratorio) && cantidad.equals(that.cantidad) && precio.equals(that.precio);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, codigo, nombre, laboratorio, cantidad, precio);
    }

    @Override
    public String toString() {
        return "Medicamento" +
                "\n\tID: " + id +
                "\n\tCodigo: '" + codigo + '\'' +
                "\n\tNombre: '" + nombre + '\'' +
                "\n\tLaboratorio: '" + laboratorio + '\'' +
                "\n\tCantidad: " + cantidad +
                "\n\tPrecio: $" + precio;
    }
}
