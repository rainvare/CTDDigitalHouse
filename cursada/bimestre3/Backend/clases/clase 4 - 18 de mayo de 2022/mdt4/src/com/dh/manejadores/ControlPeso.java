package com.dh.manejadores;

import com.dh.Articulo;
import com.dh.Control;

public class ControlPeso extends Control {
    public ControlPeso() {
    }

    @Override
    public String comprobar(Articulo articulo) {
        boolean esAceptable = (articulo.getPeso()>= 1200) && (articulo.getPeso()<= 1300);
        String resultadoControl = "Peso es aceptado";


        if (esAceptable) {
            System.out.println(resultadoControl);
            if (this.siguienteControl != null) {
                resultadoControl = this.siguienteControl.comprobar(articulo);
            }
        } else {
            resultadoControl = "El peso es rechazado";
        }
        return resultadoControl;
    }
}
