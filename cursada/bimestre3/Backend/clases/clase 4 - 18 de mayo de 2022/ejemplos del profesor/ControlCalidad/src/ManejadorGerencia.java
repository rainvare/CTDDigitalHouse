public class ManejadorGerencia extends Manejador
    {
        // --------------------------------------------------
        @Override
        public void comprobar(Mail email)
        {
            if ((email.getDestino().equalsIgnoreCase("gerencia@colmena.com")) ||
                (email.getTema().equalsIgnoreCase("gerencial")))
            {
                System.out.println("Enviado a gerencia");
            }
            else
            {
                if( this.getSiguiente() != null )
                {
                    // Llamamos al método en el siguiente objeto
                    this.getSiguiente().comprobar( email );
                }
            }
        }
    }
