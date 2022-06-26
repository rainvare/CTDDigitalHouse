package com.company;

import java.util.Date;

public class RegistroVacunaProxy implements Registro{
    Persona persona;
    @Override
    public void registrar(Object[] datos) {
        if (comprobarFecha((Date)(datos[1]))) {
            RegistroVacuna registro = new RegistroVacuna();
            registro.registrar(datos);
        }



    }
    public boolean comprobarFecha( Date fecha)
    {
        return fecha.before(new Date());
    }
}
