package animales;

public class Tigre extends Felino {

    public Tigre(String nombre, int edad) throws Exception {
        super(nombre, edad);
    }

    @Override
    public void correr() {
        logger.info("El tigre " + nombre + " está corriendo");
    }

    @Override
    public void esMayorA10() {
        if (this.edad > 10) {
            logger.info("El tigre " + nombre + " tiene más de 10 años");
        }
    }
}
