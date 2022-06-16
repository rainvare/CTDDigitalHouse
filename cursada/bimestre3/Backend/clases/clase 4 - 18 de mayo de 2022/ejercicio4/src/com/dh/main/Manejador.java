package com.dh.main.manejadores;

import com.dh.main.Mail;

public abstract class Manejador {
    protected Manejador siguienteManejador;
// getter y setter
    public Manejador getSiguienteManejador() {
        return siguienteManejador;
    }

    public void setSiguienteManejador(Manejador siguienteManejador) {
        this.siguienteManejador = siguienteManejador;
    }

    // método para configurar el mail
    public abstract void comprobar(Mail elmail);

}
