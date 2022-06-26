package com.dh.manejadores;

import com.dh.Articulo;
import com.dh.Control;

public class ControlEnvase extends Control {

    public ControlEnvase() {
        super();
    }


    @Override
    public String comprobar(Articulo a) {
        boolean esAceptable = (a.getEnvasado().equals("sano")) || (a.getEnvasado().equals("casi sano"));
        String resultadoControl = "Envasado es aceptado";

        if (esAceptable) {
            if (this.siguienteControl != null) {
                System.out.println("El articulo es rechazado");
            }
        } else {
            resultadoControl = "El artículo no pasó los controles";
        }
        return resultadoControl;
    }
}
