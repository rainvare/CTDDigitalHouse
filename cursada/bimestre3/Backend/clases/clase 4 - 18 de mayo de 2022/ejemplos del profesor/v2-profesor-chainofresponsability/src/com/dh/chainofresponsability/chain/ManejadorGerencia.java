package com.dh.chainofresponsability.chain;

import com.dh.chainofresponsability.model.Correo;

public class ManejadorGerencia extends Manejador{

    public ManejadorGerencia(){
        this.direccionDeCorreoAsignada = "gerencia@colmena.com";
        this.asuntoPorAtender = "gerencia";
    }

    @Override
    public String comprobar(Correo email) {
        String mensaje = "";
        if(this.esValidoElCorreo(email)){
            mensaje = "Enviado a gerencia";
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
