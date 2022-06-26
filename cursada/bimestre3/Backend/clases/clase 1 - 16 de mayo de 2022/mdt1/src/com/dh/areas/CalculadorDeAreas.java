package com.dh.areas;

public class CalculadorDeAreas {

    public String calcularAreaDelCirculo(double radio){
        double area = (radio * radio) * Math.PI;
        return "El área del círculo es de " + area + " unidades";
    }

    public String calcularAreaDelCuadrado(double longitudLado){
        double area = longitudLado * longitudLado;
        return "El área del cuadrado es de " + area + " unidades";
    }
}
