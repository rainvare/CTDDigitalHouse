package com.dh.chainofresponsability.chain;

import com.dh.chainofresponsability.model.Correo;

public class ManejadorSoporteIT extends Manejador
{

    public ManejadorSoporteIT(){
        this.direccionDeCorreoAsignada = "soporte@headingsas.com";
        this.asuntoPorAtender = "soporte técnico";
    }

    @Override
    public String comprobar(Correo email) {
        String mensaje = "";

        if(this.esValidoElCorreo(email)){
            mensaje = "Envio a soporte IT.";
        }
        else {
            if(this.getSiguiente() != null) {
                // Pasamos el mensaje al siguiente responsable
                mensaje = this.getSiguiente().comprobar(email);
            }
        }

        return mensaje;
    }
}