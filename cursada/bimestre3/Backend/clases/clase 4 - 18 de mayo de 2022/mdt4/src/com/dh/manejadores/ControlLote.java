package com.dh.manejadores;

import com.dh.Articulo;
import com.dh.Control;

public class ControlLote extends Control {


    public ControlLote() {
        super();
    }


    @Override
    public String comprobar(Articulo a) {
        boolean esAceptable = (a.getLote() >= 1000) && (a.getLote() <= 2000);
        String resultadoControl = "Lote es aceptado";

        if (esAceptable) {
            System.out.println(resultadoControl);
            if (this.siguienteControl != null) {
                resultadoControl = this.siguienteControl.comprobar(a);
            }
        } else {
            resultadoControl = "El lote es rechazado";
        }
        return resultadoControl;
    }
}
