package com.company;

public class EstacionException extends Exception{

    public EstacionException() {
        super();
    }
    public EstacionException(String mensaje) {
        super(mensaje);
    }

    public String toString() {
        return "Se produjo la siguiente Excepción: " + this.getClass().getName() + "\n Mensaje: " + this.getMessage() + "\n";
    }
}
