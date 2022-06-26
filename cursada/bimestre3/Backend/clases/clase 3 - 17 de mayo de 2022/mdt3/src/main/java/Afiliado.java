public class Afiliado extends Vendedor{
    public Afiliado(String nombre, String categoria, Integer puntos) {
        super(nombre, categoria, puntos);
    }

    @Override
    public void vender() {
        System.out.println("el afiliado" + nombre + " está vendiendo...");
        this.puntos += 15;
    }

    @Override
    public int calcularPuntos() {
        return this.puntos;
    }
}
