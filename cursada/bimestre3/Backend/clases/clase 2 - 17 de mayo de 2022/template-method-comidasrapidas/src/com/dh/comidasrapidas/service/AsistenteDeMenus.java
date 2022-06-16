package com.dh.comidasrapidas.service;

import com.dh.comidasrapidas.model.Menu;

public abstract class AsistenteDeMenus {

    public double preparar(Menu menu)
    {
        System.out.println(armar());
        return calcularPrecio(menu);
    }
    public abstract String armar(); //Este es un método plantilla (template method)

    public abstract double calcularPrecio(Menu menu); //Este es un método plantilla (template method)
}
