package animales;

import org.apache.log4j.Logger;

public abstract class Felino {

    protected final static Logger logger = Logger.getLogger(Felino.class);
    protected String nombre;
    protected int edad;

    public Felino(String nombre, int edad) throws Exception {
        if (edad < 1) throw new Exception("La edad de " + nombre + " es incorrecta");
        this.nombre = nombre;
        this.edad = edad;
    }

    public abstract void correr();
    public abstract void esMayorA10();
}
