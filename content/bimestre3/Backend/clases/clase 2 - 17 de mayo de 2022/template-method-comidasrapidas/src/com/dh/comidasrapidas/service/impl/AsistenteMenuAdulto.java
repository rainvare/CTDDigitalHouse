package com.dh.comidasrapidas.service.impl;

import com.dh.comidasrapidas.model.Menu;
import com.dh.comidasrapidas.service.AsistenteDeMenus;

public class AsistenteMenuAdulto extends AsistenteDeMenus {
    private double racargoPorJuguete = 3;


    @Override
    public String armar() {
        return "\t1 - Agregar carne.\n\t2 - Agregar pan árabe. \n\t3 - Empacar.";
    }

    @Override
    public double calcularPrecio(Menu menu) {
        return menu.getPrecioBase();
    }

}
