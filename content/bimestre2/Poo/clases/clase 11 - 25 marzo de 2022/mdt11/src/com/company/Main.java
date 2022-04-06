package com.company;

public class Main {

    public static void main(String[] args) {
	// write your code here

        Cliente cliente = new Cliente(1,"Requiz",95323206,279532320);
        Cliente cliente1 = new Cliente(2,"Molina",95456983,279545698);

        Cuenta cuenta = new CuentaAhorro(cliente, 50000.0,1, 2.0);

        System.out.println("El saldo inicial del cliente es: " + cuenta.getSaldo());
        cuenta.extraer(7500.0);
        System.out.println("Se ha registrado una extracción y su saldo actual es de: " + cuenta.getSaldo());
        cuenta.depositar(1000.0);
        System.out.println("Se ha registrado un depósito y su saldo ahora es de: " + cuenta.getSaldo());
        ((CuentaAhorro)cuenta).cobrarInteres();
        System.out.println("Ha cobrado el interes, y su nuevo saldo es de: " + cuenta.getSaldo());

        cuenta = new CuentaCorriente(cliente1, 8606.0, 2,300.0);
        cuenta.extraer(750.0);
        System.out.println("Se ha registrado una extraccion, su saldo es de: "+ cuenta.getSaldo());
        System.out.println("El monto de su descubierto es de: "+ ((CuentaCorriente)cuenta).getMontoDescubierto());
    }
}
