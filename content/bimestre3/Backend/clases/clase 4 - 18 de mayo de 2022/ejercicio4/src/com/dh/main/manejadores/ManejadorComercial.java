package com.dh.main.manejadores;

import com.dh.main.Mail;

public class ManejadorComercial extends com.dh.main.manejadores.Manejador {
    @Override
    public void comprobar(Mail elmail) {
        if((elmail.getDestino().equalsIgnoreCase("comercial@colmena.com"))||
                (elmail.getTema().equalsIgnoreCase("Comercial")));
        {
            System.out.println("Enviado a comercial");
        }else{
            if(this.getSiguienteManejador()!=null){
                this.getSiguienteManejador().comprobar(elmail);
            }
        }
    }
}
