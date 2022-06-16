package com.company;

import java.util.Objects;

public class Cliente {

    private Integer numeroCliente;
    private String apellido;
    private Integer DNI;
    private Integer CUIT;

    public Cliente(Integer numeroCliente, String apellido, Integer DNI, Integer CUIT) {
        this.numeroCliente = numeroCliente;
        this.apellido = apellido;
        this.DNI = DNI;
        this.CUIT = CUIT;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Cliente cliente = (Cliente) o;
        return numeroCliente.equals(cliente.numeroCliente);
    }

    @Override
    public int hashCode() {
        Integer hash = 25;
        return hash*Objects.hash(numeroCliente);
    }

    @Override
    public String toString() {
        return "Cliente{" +
                "numeroCliente=" + numeroCliente +
                ", apellido='" + apellido + '\'' +
                ", DNI=" + DNI +
                ", CUIT=" + CUIT +
                '}';
    }
}
