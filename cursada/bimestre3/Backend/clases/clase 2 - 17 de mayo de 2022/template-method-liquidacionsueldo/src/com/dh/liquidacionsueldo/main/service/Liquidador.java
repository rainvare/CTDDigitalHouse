package com.dh.liquidacionsueldo.main.service;

import com.dh.liquidacionsueldo.main.model.Empleado;

public abstract class Liquidador {

    public abstract String liquidarSueldo(Empleado empleado); //Método plantilla (Template Method)

    public String depositarSueldo(Empleado empleado){
        return "Sueldo depositado en la cuenta " + empleado.getNumeroDeCuenta();
    }
}
