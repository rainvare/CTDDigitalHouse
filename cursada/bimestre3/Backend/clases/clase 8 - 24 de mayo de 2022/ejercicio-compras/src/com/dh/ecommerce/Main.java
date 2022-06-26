package com.dh.ecommerce;

import com.dh.ecommerce.model.Direccion;
import com.dh.ecommerce.model.Producto;
import com.dh.ecommerce.model.Tarjeta;
import com.dh.ecommerce.service.ICompraService;
import com.dh.ecommerce.service.impl.AlmacenService;
import com.dh.ecommerce.service.impl.CompraService;
import com.dh.ecommerce.service.impl.EnvioService;
import com.dh.ecommerce.service.impl.PagoService;

import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        Producto productoUno = new Producto("1",5,1000,"Mouse");
        Producto productoDos = new Producto("2",5,3000,"Teclado");
        Tarjeta tarjeta  = new Tarjeta("1111222233334444","012","2025/07/09");

        Direccion direccion = new Direccion("Av Monroe","860","1428","CABA","Capital federal");
        ICompraService compraService = new CompraService(new AlmacenService(Arrays.asList(productoUno,productoDos)),new PagoService(),new EnvioService());

        compraService.procesarCompra("1",2,tarjeta,direccion);

    }
}
