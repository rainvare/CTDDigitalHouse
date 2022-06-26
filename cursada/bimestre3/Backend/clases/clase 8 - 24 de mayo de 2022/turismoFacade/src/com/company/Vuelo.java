package com.company;

import java.time.LocalDate;

public class Vuelo {
    private LocalDate salida;
    private LocalDate regreso;
    private String destino;

    public Vuelo(LocalDate salida, LocalDate regreso, String destino) {
        this.salida = salida;
        this.regreso = regreso;
        this.destino = destino;
    }

    public LocalDate getSalida() {
        return salida;
    }

    public void setSalida(LocalDate salida) {
        this.salida = salida;
    }

    public LocalDate getRegreso() {
        return regreso;
    }

    public void setRegreso(LocalDate regreso) {
        this.regreso = regreso;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    @Override
    public String toString() {
        return "Vuelo{" +
                "salida=" + salida +
                ", regreso=" + regreso +
                ", destino='" + destino + '\'' +
                '}';
    }
}
