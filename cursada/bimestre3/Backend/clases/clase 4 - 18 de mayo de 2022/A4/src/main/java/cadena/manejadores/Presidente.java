package cadena.manejadores;
import cadena.Documento;

public class Presidente extends Jerarca {

    public Presidente() {
        super();
    }

    public Presidente(Jerarca siguienteJerarca) {
        super(siguienteJerarca);
    }

    public void leer(Documento documento) {
        documento.leer(this);
        if (siguienteJerarca != null) {
            siguienteJerarca.leer(documento);
        }
    }
}
