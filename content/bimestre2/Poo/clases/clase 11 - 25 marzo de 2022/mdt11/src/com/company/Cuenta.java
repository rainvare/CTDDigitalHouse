package com.company;

import java.util.Objects;

public abstract class Cuenta {

    private Cliente cliente;
    protected Double saldo;
    private Integer numeroCuenta;

    public Cuenta(Cliente cliente, Double saldo, Integer numeroCuenta) {
        this.cliente = cliente;
        this.saldo = saldo;
        this.numeroCuenta = numeroCuenta;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Double getSaldo() {
        return saldo;
    }

    public void setSaldo(Double saldo) {
        this.saldo = saldo;
    }

    public Integer getNumeroCuenta() {
        return numeroCuenta;
    }

    public void setNumeroCuenta(Integer numeroCuenta) {
        this.numeroCuenta = numeroCuenta;
    }

    public abstract void extraer(Double montoExtraer);

    public void depositar(Double montoDepositar) {
        this.saldo += montoDepositar;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Cuenta cuenta = (Cuenta) o;
        return numeroCuenta.equals(cuenta.numeroCuenta);
    }

    @Override
    public int hashCode() {
        int hash = 13;
        return hash*Objects.hash(numeroCuenta);
    }

    @Override
    public String toString() {
        return "Cuenta{" +
                "cliente=" + cliente +
                ", saldo=" + saldo +
                ", numeroCuenta=" + numeroCuenta +
                '}';
    }
}
