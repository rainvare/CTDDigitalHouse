package animales;

public class Leon extends Felino {

    private boolean esAlfa;

    public Leon(String nombre, int edad, boolean esAlfa) throws Exception {
        super(nombre, edad);
        this.esAlfa = esAlfa;
        logger.debug("Instanciando león " + nombre);
    }

    public Leon(String nombre, int edad) throws Exception {
        super(nombre, edad);
        this.esAlfa = false;
    }

    @Override
    public void correr() {
        logger.info("El león " + nombre + " está corriendo");
    }

    @Override
    public void esMayorA10() {
        if (this.edad > 10 && esAlfa) {
            logger.info("El león " + nombre + " es el alfa y tiene más de 10 años");
        }
    }
}
