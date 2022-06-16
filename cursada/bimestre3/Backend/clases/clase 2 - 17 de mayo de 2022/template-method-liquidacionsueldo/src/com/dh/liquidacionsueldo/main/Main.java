package com.dh.liquidacionsueldo.main;

import com.dh.liquidacionsueldo.main.model.Empleado;
import com.dh.liquidacionsueldo.main.service.Liquidador;
import com.dh.liquidacionsueldo.main.service.impl.LiquidadorEmpleadoContratado;
import com.dh.liquidacionsueldo.main.service.impl.LiquidadorEmpleadoEfectivo;

import java.util.List;
import java.util.Map;

public class Main {

    public static void main(String[] args) {
        Map<String, Liquidador> liquidadores = Map.of("Efectivo", new LiquidadorEmpleadoEfectivo(),
                                                      "Contratado", new LiquidadorEmpleadoContratado());

        List<Empleado> empleados = List.of();
    }
}
