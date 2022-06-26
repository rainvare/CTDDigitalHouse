package com.dh.ecommerce.model;

public class Producto {

    private String productoId;
    private Integer cantidad;
    private Integer valor;
    private String nombre;

    public Producto(String productoId, Integer cantidad, Integer valor, String nombre) {
        this.productoId = productoId;
        this.cantidad = cantidad;
        this.valor = valor;
        this.nombre = nombre;
    }

    public String getProductoId() {
        return productoId;
    }

    public void setProductoId(String productoId) {
        this.productoId = productoId;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Integer getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Producto{" +
                "productoId='" + productoId + '\'' +
                ", cantidad=" + cantidad +
                ", valor='" + valor + '\'' +
                ", nombre='" + nombre + '\'' +
                '}';
    }
}
