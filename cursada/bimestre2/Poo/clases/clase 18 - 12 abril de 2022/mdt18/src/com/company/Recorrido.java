package com.company;

public class Recorrido {

    private String destino;
    private String partida;

    public Recorrido(String destino, String partida) {
        this.destino = destino;
        this.partida = partida;
    }

    public boolean tieneDescuento() {
        return (destino.equals("Buenos Aires") && partida.equals("Bragado")) || (destino.equals("Bragado") && partida.equals("Buenos Aires"));
    }

    public String getDestino() {
        return destino;
    }

    public String getPartida() {
        return partida;
    }
}
