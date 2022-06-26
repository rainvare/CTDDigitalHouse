package dh.com.Main.entidades;

public class Avion {
    private Long id;
    private String marca;
    private String modelo;
    private String matricula;
    private String fechaEntradaServicio;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getFechaEntradaServicio() {
        return fechaEntradaServicio;
    }

    public void setFechaEntradaServicio(String fechaEntradaServicio) {
        this.fechaEntradaServicio = fechaEntradaServicio;
    }
}
