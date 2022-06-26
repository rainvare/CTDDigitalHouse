package com.dh.chainofresponsability.chain;

import com.dh.chainofresponsability.model.Correo;

public class ManejadorComercial extends Manejador{

    public ManejadorComercial(){
        this.direccionDeCorreoAsignada = "comercial@colmena.com";
        this.asuntoPorAtender = "comercial";
    }

    @Override
    public String comprobar(Correo email) {
        String mensaje = "";

        if(this.esValidoElCorreo(email)){
            mensaje = "Enviado a comercial";
        }
        else {
            if(this.getSiguiente() != null) {
                // Pasamos el mensaje al siguiente responsable
                mensaje = this.getSiguiente().comprobar( email );
            }
        }

        return mensaje;
    }
}