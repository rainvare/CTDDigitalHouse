package com.dh.liquidacionsueldo.main.service.impl;

import com.dh.liquidacionsueldo.main.model.Empleado;
import com.dh.liquidacionsueldo.main.model.EmpleadoEfectivo;
import com.dh.liquidacionsueldo.main.service.Liquidador;

public class LiquidadorEmpleadoEfectivo extends Liquidador {
    @Override
    public String liquidarSueldo(Empleado empleado) {
        String mensajeDeRespuesta = "La liquidación no pudo ser calculada.";

        if(empleado instanceof EmpleadoEfectivo){
            EmpleadoEfectivo empleadoEfectivo = (EmpleadoEfectivo) empleado;
            int sueldoFinal = empleadoEfectivo.getSueldoBase() + empleadoEfectivo.getBonos() - empleadoEfectivo.getDescuentos();
            mensajeDeRespuesta = "La liquidación generada es un documento digital. Saldo a liquidar: " + sueldoFinal;
        }

        return mensajeDeRespuesta;
    }
}
