public class ManejadorEnvase extends  Manejador{

    public void comprobar(Articulo arti)
    {
        if (!arti.getEnvase().equalsIgnoreCase("sano") &&
            !arti.getEnvase().equalsIgnoreCase("casi sano"))
        {
            System.out.println("Rechazado por envase");
        }

        else
        {
            if( this.getSiguiente() != null )
            {
                // Llamamos al método en el siguiente objeto
                this.getSiguiente().comprobar( arti );
            }
        }
    }

}

