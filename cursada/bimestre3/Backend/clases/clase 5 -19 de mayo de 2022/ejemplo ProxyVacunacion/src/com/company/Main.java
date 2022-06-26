package com.company;

import java.util.Date;

public class Main {

    public static void main(String[] args) {

        Persona persona = new Persona(" Juan ","Perez","35242184","Pfizer",new Date(121,6,5));
        Registro registro= new RegistroVacunaProxy();
        registro.registrar(persona.datos());

    }
}
