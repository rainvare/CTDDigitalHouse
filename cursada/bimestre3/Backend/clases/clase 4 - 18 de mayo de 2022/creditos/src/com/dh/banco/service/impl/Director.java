package com.dh.banco.service.impl;

import com.dh.banco.service.EmpleadoBanco;

public class Director extends EmpleadoBanco {
    @Override
    public void procesarSolicitud(Integer monto) {
        if (monto > 200000)
            System.out.println("Yo me encargo de gestionarlo. Director");
        else if (this.sigEmpleadoBanco != null)
            this.sigEmpleadoBanco.procesarSolicitud(monto);
    }
}
