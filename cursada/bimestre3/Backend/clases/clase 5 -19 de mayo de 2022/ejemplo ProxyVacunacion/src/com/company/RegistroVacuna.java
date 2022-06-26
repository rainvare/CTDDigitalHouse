package com.company;

public class RegistroVacuna implements Registro{


    @Override
    public void registrar(Object[] datos) {
        System.out.println("Se ha registrado el " + datos[0] + " en la fecha " + datos[1].toString() + " como vacunado ");
    }

}
