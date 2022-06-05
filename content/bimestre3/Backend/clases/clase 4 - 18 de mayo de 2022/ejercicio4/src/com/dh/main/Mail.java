package com.dh.main;

public class Mail {
    private String nombre;
    private String tema;
    private String destino;
//constructor
    public Mail(String nombre, String tema, String destino) {
        this.nombre = nombre;
        this.tema = tema;
        this.destino = destino;
    }
// getter y setter
    public String getNombre() {
        return nombre;
    }

    public String getTema() {
        return tema;
    }

    public String getDestino() {
        return destino;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }
}
