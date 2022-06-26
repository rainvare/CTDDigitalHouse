package cadena.manejadores;
import cadena.Documento;

public class Ministro extends Jerarca {

    public Ministro() {
        super();
    }

    public Ministro(Jerarca siguienteJerarca) {
        super(siguienteJerarca);
    }

    public void leer(Documento documento) {
        documento.leer(this);
        if (siguienteJerarca != null) {
            siguienteJerarca.leer(documento);
        }
    }
}