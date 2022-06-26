package com.dh.banco.service.impl;

import com.dh.banco.service.EmpleadoBanco;

public class EjecutivoCuenta extends EmpleadoBanco {


    @Override
    public void procesarSolicitud(Integer monto) {
        if (monto < 60000)
            System.out.println("Yo me encargo de gestionarlo. Ejecutivo de cuenta");
        else if (this.sigEmpleadoBanco != null)
            this.sigEmpleadoBanco.procesarSolicitud(monto);

    }
}
