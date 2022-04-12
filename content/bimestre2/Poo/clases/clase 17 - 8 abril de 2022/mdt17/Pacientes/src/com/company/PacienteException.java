package com.company;

public class PacienteException extends Exception{
    public PacienteException() {
    }

    public PacienteException(String message) {
        super(message);
    }

    @Override
    public String toString() {
        return "Error, se genero la siguiente excepcion: "+getMessage();
    }
}
