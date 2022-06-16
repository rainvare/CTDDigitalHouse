package com.dh.main.manejadores;

import com.dh.main.Mail;

public class ManejadorSpam extends com.dh.main.manejadores.Manejador {
    @Override
    public void comprobar(Mail email) {
            System.out.println("Marcado como Spam");
    }
}
