package com.dh.main.manejadores;

import com.dh.main.Mail;

public class ManejadorTecnica extends com.dh.main.manejadores.Manejador {
    @Override
    public void comprobar(Mail email) {
        if((email.getDestino().equalsIgnoreCase("tecnica@colmena.com"))||
                (email.getTema().equalsIgnoreCase("Técnico")));
        {
            System.out.println("Enviado a técnico");
        }else{
            if(this.getSiguienteManejador()!=null){
                this.getSiguienteManejador().comprobar(email);
            }
    }
}
