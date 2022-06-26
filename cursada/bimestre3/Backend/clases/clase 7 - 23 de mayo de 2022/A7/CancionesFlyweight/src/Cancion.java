public class Cancion {
    private String nombre;
    private String artista;
    private String genero;

    public Cancion(String nombre) {
        this.nombre = nombre;
    }

    public String getArtista() {
        return artista;
    }

    public void setArtista(String artista) {
        this.artista = artista;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String imprimirCancion(){
        return "Canción: " + this.nombre + ", Artista: " + getArtista() + ", Género: " + getGenero();
    }

    @Override
    public String toString() {
        return "Canción: " + this.nombre + ", Artista: " + getArtista() + ", Género: " + getGenero();
    }
}
