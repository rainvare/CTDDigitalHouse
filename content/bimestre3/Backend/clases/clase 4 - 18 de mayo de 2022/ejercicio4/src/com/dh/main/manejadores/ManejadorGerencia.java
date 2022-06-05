package com.dh.main.manejadores;

import com.dh.main.Mail;

public class ManejadorGerencia extends com.dh.main.manejadores.Manejador {
    @Override
    public void comprobar(Mail email) {
        if((email.getDestino().equalsIgnoreCase("gerencia@colmena.com"))||
                (email.getTema().equalsIgnoreCase("Gerencial")));
        {
            System.out.println("Enviado a gerencia");
        }else{
            if(this.getSiguienteManejador()!=null){
                this.getSiguienteManejador().comprobar(email);
            }
    }
}
