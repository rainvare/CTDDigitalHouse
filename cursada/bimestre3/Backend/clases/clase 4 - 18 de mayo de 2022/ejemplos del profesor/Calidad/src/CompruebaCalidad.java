public class CompruebaCalidad
    {
    Manejador inicial;

    public CompruebaCalidad() {
        this.inicial = new ManejadorLote();
        Manejador peso = new ManejadorPeso();
        Manejador envase = new ManejadorEnvase();
        Manejador acepta = new ManejadorAceptar();

        inicial.setSiguiente( peso );
        peso.setSiguiente( envase );
        envase.setSiguiente( acepta );
    }

    public void comprobar(Articulo  arti)
        {
            inicial.comprobar( arti );
        }
    }
