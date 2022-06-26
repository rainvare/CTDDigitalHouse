public class Articulo {

    private String nombre;
    private int lote;
    private int peso;
    private String envase;

    public Articulo(String nombre, int lote, int peso, String envase) {
        this.nombre = nombre;
        this.lote = lote;
        this.peso = peso;
        this.envase = envase;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getLote() {
        return lote;
    }

    public void setLote(int lote) {
        this.lote = lote;
    }

    public int getPeso() {
        return peso;
    }

    public void setPeso(int peso) {
        this.peso = peso;
    }

    public String getEnvase() {
        return envase;
    }

    public void setEnvase(String envase) {
        this.envase = envase;
    }
}
