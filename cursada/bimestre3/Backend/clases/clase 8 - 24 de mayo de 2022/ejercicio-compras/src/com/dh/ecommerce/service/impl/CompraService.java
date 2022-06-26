package com.dh.ecommerce.service.impl;

import com.dh.ecommerce.model.Direccion;
import com.dh.ecommerce.model.Producto;
import com.dh.ecommerce.model.Tarjeta;
import com.dh.ecommerce.service.ICompraService;

import java.util.Arrays;

public class CompraService implements ICompraService {

    private AlmacenService almacenService;
    private PagoService pagoService;
    private EnvioService envioService;

    public CompraService(AlmacenService almacenService, PagoService pagoService, EnvioService envioService) {
        this.almacenService = almacenService;
        this.pagoService = pagoService;
        this.envioService = envioService;
    }

    @Override
    public void procesarCompra(String productoId, Integer cantidad, Tarjeta tarjeta, Direccion direccion) {
        Producto producto = almacenService.buscarProducto(productoId,cantidad);
        if(producto != null){
            //Si tenemos el producto, procesamos el pago
           if(pagoService.procesarPago(tarjeta,String.valueOf(producto.getValor() * cantidad))){
               envioService.procesarEnvio(Arrays.asList(producto),direccion);
           }

        }
    }
}
