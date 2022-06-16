package com.dh.comidasrapidas.service.impl;

import com.dh.comidasrapidas.model.Menu;
import com.dh.comidasrapidas.service.AsistenteDeMenus;

public class AsistenteMenuInfantil extends AsistenteDeMenus {
    private double racargoPorJuguete = 3;


    @Override
    public String armar() {
        return "\t1 - Agregar croquetas.\n\t2 - Agregar pan árabe. \n\t3 - Agregar juguetes. \n\t4 - Empacar.";
    }

    @Override
    public double calcularPrecio(Menu menu) {
        return menu.getPrecioBase() + (racargoPorJuguete * menu.getJuguetesIncluidos());
    }
}
