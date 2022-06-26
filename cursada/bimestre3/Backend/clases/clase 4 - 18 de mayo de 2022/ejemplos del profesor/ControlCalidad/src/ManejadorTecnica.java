public class ManejadorTecnica extends Manejador
{

    // --------------------------------------------------

    @Override
    public void comprobar(Mail email)
    {
        if ((email.getDestino().equalsIgnoreCase("tecnica@digitalhouse.com")) ||
                (email.getTema().equalsIgnoreCase("tecnica")))
        {
            System.out.println("Envio a tecnica");
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