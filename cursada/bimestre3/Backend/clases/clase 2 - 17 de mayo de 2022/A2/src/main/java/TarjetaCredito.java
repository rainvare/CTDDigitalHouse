public class TarjetaCredito extends Tarjeta{
    private double limite;
    private double saldo;

    //constructor

    public TarjetaCredito(Integer nrosFrente, Integer nroSeguridad, Integer fechaExpiracion, Double importe, double limite, double saldo) {
        super(nrosFrente, nroSeguridad, fechaExpiracion, importe);
        this.limite = limite;
        this.saldo = saldo;
    }
//métodos
    @Override
    protected void procesarPago(double importe) {
        if ((importe + saldo) <= limite) {
            saldo += importe;
            mostrarPago();
        }
    }

    @Override
    protected void mostrarPago() {
        System.out.println("\tPago autorizado\n\tSaldo utilizado: $" + saldo);
    }

}
