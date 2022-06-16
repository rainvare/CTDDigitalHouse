package com.company.cuentas;
import com.company.Cliente;
import jdk.swing.interop.SwingInterOpUtils;

public class CuentaComitente extends Cuenta {

    private String CNV;

    public CuentaComitente(Cliente titular, Double saldo, String CNV) {
        super(titular, saldo);
        this.CNV = CNV;
    }


    @Override
    public void depositar(Double monto) {
        monto -= (monto *1)/100;
        super.depositar(monto);
    }

    @Override
    public void extraer(Double monto) {
        if (monto < saldo && monto <= saldo/2){
            saldo -= monto;
            informarSaldo();
        } else if (monto < saldo && monto > saldo/2){
            System.out.println("El monto ingresado no es válido, ingresar CNV");
        } else {
            System.out.println("El monto ingresado no es válido");
        }

    }

    public void extraer(Double monto, String CNV){
        if (monto < saldo && monto <= saldo/2){
            saldo -= monto;
            informarSaldo();
        } else if (monto < saldo && monto > saldo/2 && this.CNV.equals(CNV)){
            saldo -= monto;
            informarSaldo();
        } else if (monto < saldo && monto > saldo/2 && this.CNV != CNV){
            System.out.println("La clave ingresada no es válida");
        } else {
            System.out.println("El monto ingresado no es válido");
        }
    }
    }



