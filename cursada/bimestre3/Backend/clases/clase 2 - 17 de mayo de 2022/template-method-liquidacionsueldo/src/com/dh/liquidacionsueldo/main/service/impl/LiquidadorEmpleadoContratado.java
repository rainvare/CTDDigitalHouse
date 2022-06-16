package com.dh.liquidacionsueldo.main.service.impl;

import com.dh.liquidacionsueldo.main.model.Empleado;
import com.dh.liquidacionsueldo.main.model.EmpleadoContratado;
import com.dh.liquidacionsueldo.main.model.EmpleadoEfectivo;
import com.dh.liquidacionsueldo.main.service.Liquidador;

public class LiquidadorEmpleadoContratado extends Liquidador {

    @Override
    public String liquidarSueldo(Empleado empleado) {
        String mensajeDeRespuesta = "La liquidación no pudo ser calculada.";

        if(empleado instanceof EmpleadoContratado){
            EmpleadoContratado empleadoContratado = (EmpleadoContratado) empleado;
            int sueldoFinal = empleadoContratado.getHorasTrabajadas() * empleadoContratado.getValorHora();
            mensajeDeRespuesta = "La liquidación generada es un documento impreso. Saldo a liquidar: " + sueldoFinal;
        }

        return mensajeDeRespuesta;
    }
}
