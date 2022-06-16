package com.dh.main;


import com.dh.main.manejadores.*;
import com.dh.main.manejadores.Manejador;

//seteo
public class CompruebaMail {
    Manejador inicial;

    //organizo a los manejadores
    public CompruebaMail() {
this.inicial = new ManejadorGerencia();
  Manejador tecnica = new ManejadorTecnica();
  Manejador comercial = new ManejadorComercial();
Manejador spam = new ManejadorSpam();

//defino cómo se pasa la cadena
inicial.setSiguienteManejador(comercial);
comercial.setSiguienteManejador(tecnica);
tecnica.setSiguienteManejador(spam);
    }

    public void comprobar(Mail email){
        inicial.comprobar(email);
    }
}