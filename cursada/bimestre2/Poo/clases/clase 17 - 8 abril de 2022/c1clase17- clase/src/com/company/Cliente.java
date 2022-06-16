package com.company;

public class Cliente {

    private String nombre;
    private String apellido;
    private Integer dni;
    private Double saldoEnCuenta;
    private Double limiteDeCompra;
    private Double deuda;


    public Cliente(String nombre, String apellido, Integer dni, Double limiteDeCompra) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.limiteDeCompra = limiteDeCompra;
        deuda = 0.0;
        saldoEnCuenta = 0.0;
    }

    public Cliente(String nombre, String apellido, Integer dni, Double saldoEnCuenta, Double limiteDeCompra, Double deuda) throws ClienteException {
       if(deuda < 0){
           throw new ClienteException("ingresaste una deuda negativa");
       }
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.saldoEnCuenta = saldoEnCuenta;
        this.limiteDeCompra = limiteDeCompra;
        this.deuda = deuda;

    }

    public void comprar(Double importe) throws ClienteException{
        if(importe > limiteDeCompra){
            // quiero que rompas osea que tires una exception
            throw new ClienteException("tu limite es de " + limiteDeCompra + " y intentaste comprar algo de valor " + importe);
        }

        deuda += importe;

    }


}
