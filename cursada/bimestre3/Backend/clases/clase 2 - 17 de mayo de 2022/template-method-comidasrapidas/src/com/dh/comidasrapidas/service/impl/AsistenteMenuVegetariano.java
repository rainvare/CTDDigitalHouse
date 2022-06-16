package com.dh.comidasrapidas.service.impl;

import com.dh.comidasrapidas.model.Menu;
import com.dh.comidasrapidas.service.AsistenteDeMenus;

public class AsistenteMenuVegetariano extends AsistenteDeMenus {
   private double racargoIngredientes = 0.01; //Corresponde al 1%


    @Override
    public String armar() {
        return "\t1 - Agregar falafel.\n\t2 - Agregar pan árabe. \n\t3 - Agregar especias. \n\t4 - Agregar salsas. \n\t5 - Empacar.";
    }

    @Override
    public double calcularPrecio(Menu menu) {
        double recargos = (menu.getPrecioBase() * 0.01) + (menu.getSalsasAplicadas() * 2);
        return menu.getPrecioBase() + recargos;
    }
}
