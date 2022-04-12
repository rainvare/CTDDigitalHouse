package com.company;

public class RecorridoException extends Exception {

    public RecorridoException(String message) {
        super(message);
    }

    @Override
    public String toString() {
        return "Error, se genero la siguiente excepcion: " + getMessage();
    }
}