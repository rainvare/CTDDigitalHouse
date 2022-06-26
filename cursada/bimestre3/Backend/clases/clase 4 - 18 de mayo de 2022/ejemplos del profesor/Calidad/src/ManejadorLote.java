public class ManejadorLote extends Manejador {
    public void comprobar(Articulo arti)
    {
        if ((arti.getLote() < 1000) || (arti.getLote() > 2000))
        {
            System.out.println("Rechazado por lote");
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
