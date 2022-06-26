package com.dh;

import com.dh.manejadores.ControlEnvase;
import com.dh.manejadores.ControlLote;
import com.dh.manejadores.ControlPeso;

public class CompruebaCalidad {
    private Control inicial;

    public CompruebaCalidad() {
        this.inicial = new ControlLote();
        Control controlPeso = new ControlPeso();
        Control controlFinal = new ControlEnvase();

        inicial.setSiguienteControl(controlPeso);
controlPeso.setSiguienteControl(controlFinal);
    }

    public void comprobar(Articulo a) {
        System.out.println("\nArticulo: " + a.getNombre());
        System.out.println(inicial.comprobar(a));
    }
}
