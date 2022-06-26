package com.dh.ecommerce.service.impl;

import com.dh.ecommerce.model.Producto;

import java.util.List;

public class AlmacenService {
    private List<Producto> productos;

    public AlmacenService(List<Producto> productos) {
        this.productos = productos;
    }

    public Producto buscarProducto(String productoId, Integer cantidad) {
        Producto producto = null;
        for (Producto p : this.productos) {
            if (p.getProductoId().equals(productoId) && p.getCantidad() >= cantidad)
                producto = p;
            p.setCantidad(p.getCantidad() - cantidad); // actulizamos la ca
            producto.setCantidad(cantidad);

        }

        return producto;

    }

}
