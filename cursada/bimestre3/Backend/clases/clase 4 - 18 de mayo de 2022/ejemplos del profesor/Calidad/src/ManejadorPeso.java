public class ManejadorPeso extends  Manejador{

    public void comprobar(Articulo arti)
    {
        if ((arti.getPeso() < 1200) || (arti.getPeso() > 1300))
        {
            System.out.println("Rechazado por peso");
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

