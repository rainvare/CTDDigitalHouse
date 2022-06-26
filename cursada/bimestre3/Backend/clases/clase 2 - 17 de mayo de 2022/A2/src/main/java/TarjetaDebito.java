public class TarjetaDebito extends Tarjeta{
    private double saldo;

    //constructor

    public TarjetaDebito(Integer nrosFrente, Integer nroSeguridad, Integer fechaExpiracion, Double importe, double saldo) {
        super(nrosFrente, nroSeguridad, fechaExpiracion, importe);
        this.saldo = saldo;
    }
    //métodos
    @Override
    protected void procesarPago(double importe) {
        if (importe <= saldo) {
            saldo -= importe;
            mostrarPago();
        }
    }

    @Override
    protected void mostrarPago() {
        System.out.println("\tPago autorizado\n\tSaldo disponible: $" + saldo);
    }

}
