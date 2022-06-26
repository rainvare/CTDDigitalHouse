package com.dh.ecommerce.service;

import com.dh.ecommerce.model.Direccion;
import com.dh.ecommerce.model.Tarjeta;

public interface ICompraService {

    public void procesarCompra(String productoId, Integer cantidad, Tarjeta tarjeta, Direccion direccion);
}
