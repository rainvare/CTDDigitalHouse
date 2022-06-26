package cadena.manejadores;
import cadena.Documento;

public abstract class Jerarca {

    protected Jerarca siguienteJerarca;

    public Jerarca() {
        this.siguienteJerarca = null;
    }
//paso a siguiente en la cadena
    public Jerarca(Jerarca siguienteJerarca) {
        this.siguienteJerarca = siguienteJerarca;
    }

    public abstract void leer(Documento documento);
}