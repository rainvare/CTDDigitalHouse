package com.company;

import java.util.Date;

public class Main {

    public static void main(String[] args) {
        try{
            Paciente paciente=new Paciente("Juan","Perez","12345",new Date(10,5,2021));
        }catch (PacienteException e){
        e.printStackTrace();
    }

    }
}
