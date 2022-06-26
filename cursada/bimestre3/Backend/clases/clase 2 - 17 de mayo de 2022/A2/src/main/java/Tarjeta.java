public abstract class Tarjeta {
    private Integer nrosFrente;
    private Integer nroSeguridad;
    private Integer fechaExpiracion;
    private Double importe;
//constructor
    public Tarjeta(Integer nrosFrente, Integer nroSeguridad,Integer fechaExpiracion, Double importe) {
        this.nrosFrente = nrosFrente;
        this.nroSeguridad = nroSeguridad;
        this.fechaExpiracion = fechaExpiracion;
        this.importe = importe;
    }

    //métodos
    public void cobrar(double importe) {
        if (!estaVencida()) {
            procesarPago(importe);
        }
    }

    protected abstract void procesarPago(double importe);
    protected abstract void mostrarPago();

    private boolean estaVencida() {
       return fechaExpiracion>2022;
    }

}
