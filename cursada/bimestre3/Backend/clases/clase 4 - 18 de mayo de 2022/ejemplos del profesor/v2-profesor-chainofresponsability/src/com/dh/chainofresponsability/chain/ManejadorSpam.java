package com.dh.chainofresponsability.chain;

import com.dh.chainofresponsability.model.Correo;

public class ManejadorSpam extends Manejador{

    // --------------------------------------------------

    @Override
    public String comprobar(Correo email){
        return "¡Ojo! Marcado como spam....";
     }
}
