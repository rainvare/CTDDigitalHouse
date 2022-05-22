package com.dh.areas;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class CalculadorDeAreasTest {
    @Test
    public void calcularAreaCirculo_deberiaCalcularCorrectamenteElArea(){
        //DADO
        CalculadorDeAreas sujetoDePrueba = new CalculadorDeAreas();
        double radio = 10;
        String respuestaEsperada = "El área del círculo es de 314.1592653589793 unidades";

        //CUANDO
        String respuesta = sujetoDePrueba.calcularAreaDelCirculo(radio);

        //ENTONCES
        Assertions.assertEquals(respuestaEsperada, respuesta);
    }

    @Test
    public void calcularAreaDelCuadrado_deberiaCalcularCorrectamenteElArea(){
        //DADO
        CalculadorDeAreas sujetoDePrueba = new CalculadorDeAreas();
        double lado = 5;
        String respuestaEsperada = "El área del cuadrado es de 25.0 unidades";

        //CUANDO
        String respuesta = sujetoDePrueba.calcularAreaDelCuadrado(lado);

        //ENTONCES
        Assertions.assertEquals(respuestaEsperada, respuesta);
    }
}