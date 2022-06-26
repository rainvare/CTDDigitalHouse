package com.dh.chainofresponsability.test;

import com.dh.chainofresponsability.chain.*;
import com.dh.chainofresponsability.model.Correo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class ManejadorTest {

    Manejador sujetoDePrueba;

    @BeforeAll
    public void init(){
        //Creamos los eslabones de la cadena....
        this.sujetoDePrueba = new ManejadorGerencia();
        Manejador tecnica = new ManejadorSoporteIT();
        Manejador comercial = new ManejadorComercial();
        Manejador spam = new ManejadorSpam();

        //Luego los unimos.
        sujetoDePrueba.setSiguiente(comercial);
        comercial.setSiguiente(tecnica);
        tecnica.setSiguiente(spam);
    }

    @Test
    void comprobar_deberíaRetornarUnMensajeIndicandoQueElCorreoEsDeGerencia() {
        //DADO
        Correo correo = new Correo("mio@mail.com", "sds@digitalhouse.com","gerencia");
        String mensajeEsperado = "Enviado a gerencia";

        //CUANDO
        String mensajeObtenido = sujetoDePrueba.comprobar(correo);

        //ENTONCES
        Assertions.assertEquals(mensajeEsperado, mensajeObtenido);
    }
}