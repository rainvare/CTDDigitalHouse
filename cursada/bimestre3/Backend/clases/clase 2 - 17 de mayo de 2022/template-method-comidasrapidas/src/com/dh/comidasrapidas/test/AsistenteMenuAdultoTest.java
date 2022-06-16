package com.dh.comidasrapidas.test;

import com.dh.comidasrapidas.model.Menu;
import com.dh.comidasrapidas.service.AsistenteDeMenus;
import com.dh.comidasrapidas.service.impl.AsistenteMenuAdulto;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class AsistenteMenuAdultoTest {

    @Test
    public void deberiaMostrarLosPasosAdecuadosParaArmarElMenu(){
        //DADO
        AsistenteDeMenus sujetoDePrueba = new AsistenteMenuAdulto();
        String mensajeEsperado = "\t1 - Agregar carne.\n\t2 - Agregar pan árabe. \n\t3 - Empacar.";

        //CUANDO
        String mensajeObtenido = sujetoDePrueba.armar();

        //ENTONCES
        Assertions.assertEquals(mensajeEsperado, mensajeObtenido);
    }

    @Test
    public void deberiaCalcularCorrectamenteElPrecioDelMenu(){
        //DADO
        AsistenteDeMenus sujetoDePrueba = new AsistenteMenuAdulto();
        Menu menu = new Menu(30);
        double precioEsperado = 30;

        //CUANDO
        double precioObtenido = sujetoDePrueba.calcularPrecio(menu);

        //ENTONCES
        Assertions.assertEquals(precioEsperado, precioObtenido);
    }

    @Test
    public void deberiaPrepararCorrectamenteElMenu(){
        //DADO
        AsistenteDeMenus sujetoDePrueba = new AsistenteMenuAdulto();
        Menu menu = new Menu(30);
        double respuestaEsperada = 30;

        //CUANDO
        double respuestaObtenida = sujetoDePrueba.preparar(menu);

        //ENTONCES
        Assertions.assertEquals(respuestaEsperada, respuestaObtenida);
    }

    //TODO: Hacer los casos de prueba para los otros asistentes.
}
