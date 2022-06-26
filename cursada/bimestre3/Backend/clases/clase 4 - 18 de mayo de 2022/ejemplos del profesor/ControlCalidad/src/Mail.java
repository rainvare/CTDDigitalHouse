public class Mail {

    private String origen;
    private String destino;
    private String tema;

    public Mail(String origen, String destino, String tema) {
        this.origen = origen;
        this.destino = destino;
        this.tema = tema;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }
}
