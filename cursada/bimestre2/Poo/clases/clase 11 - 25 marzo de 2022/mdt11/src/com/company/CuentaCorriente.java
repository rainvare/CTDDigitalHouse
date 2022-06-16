package com.company;

public class CuentaCorriente extends Cuenta{

    private Double montoDescubierto;
// constructor
    public CuentaCorriente(Cliente cliente, Double saldo, Integer numeroCuenta, Double montoDescubierto) {
        super(cliente, saldo, numeroCuenta);
        this.montoDescubierto = montoDescubierto;
    }

    public void setMontoDescubierto(Double montoDescubierto) {
        this.montoDescubierto = montoDescubierto;
    }

    public Double getMontoDescubierto() {
        return montoDescubierto;
    }

    @Override
    public void extraer(Double montoExtraer) {
        if (this.saldo + montoDescubierto >= montoExtraer) {
            if (this.saldo >= montoExtraer) {
                this.saldo -= montoExtraer;
            }
            else {
                setMontoDescubierto(this.saldo + this.montoDescubierto - montoExtraer);
                this.saldo = 0.0;
            }
        }
    }

}
