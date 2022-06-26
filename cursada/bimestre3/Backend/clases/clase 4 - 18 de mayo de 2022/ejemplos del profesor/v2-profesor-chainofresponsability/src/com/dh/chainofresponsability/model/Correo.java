package com.dh.chainofresponsability.model;

public class Correo {

    private String origen;
    private String destino;
    private String asunto;

    public Correo(String origen, String destino, String asunto) {
        this.origen = origen;
        this.destino = destino;
        this.asunto = asunto;
    }

    public Correo(){}

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }
}
