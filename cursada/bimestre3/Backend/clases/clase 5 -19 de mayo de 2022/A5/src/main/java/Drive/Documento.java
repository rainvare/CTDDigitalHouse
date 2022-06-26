package Drive;

public abstract class Documento {
    protected String url;

    public Documento(String url) {
        this.url = url;
    }

    public String getUrl() {
        return this.url;
    }

    public abstract void abrir(String mailUsuario);

    public abstract void mostrarHistorialDeAccesos();
}
