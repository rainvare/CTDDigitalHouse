package com.company;

public class CuentaAhorro extends Cuenta{

    private Double tasaInteres;

    public CuentaAhorro(Cliente cliente, Double saldo, Integer numeroCuenta, Double tasaInteres) {
        super(cliente, saldo, numeroCuenta);
        this.tasaInteres = tasaInteres;
    }

    @Override
    public void extraer(Double montoExtraer) {
        if (this.saldo >= montoExtraer){
            this.saldo -= montoExtraer;
        }
    }

    public void cobrarInteres(){
        this.saldo *= 1+(tasaInteres/100);
    }

}
