<link rel="stylesheet" type="text/css" media="all" href="../styles.css" />

# Actividad C17 - Exceptions

En `Cliente.java`

```java
package com.company;

public class Cliente {

    private String nombre;
    private String dni;
    private Double saldo;
    private Double limite;
    private Double deuda;

    //Recibe todo menos la deuda
    public Cliente(String nombre, String dni, Double saldo, Double limite) throws ClienteException {
        if(saldo < 0){
            //No podemos frenar un constructor pero se pueden frenar clases que no queremos
            throw new ClienteException("no se puede crear clientes con saldo negativo");
        }
        this.nombre = nombre;
        this.dni = dni;
        this.saldo = saldo;
        this.limite = limite;
        deuda = 0.0;
    }

    // 
    public void saldarDeuda(Double importe) throws ClienteException {
        if(deuda < importe){
            // rompe
            throw new ClienteException("tu deuda es de " + deuda + " y estas intentando pagar " + importe);
        }
        deuda -=  importe;
    }

    public void comprar(Double importe) throws ClienteException {
        // Si el importe es menor al limite se resta ese importe al saldo
        if(importe <= limite){
            saldo -= importe;
        }else {
            // Si el importe supera el limite se le informa:
            throw new ClienteException(" queres comprar algo de " + importe + "  y tu limite es de " + limite);
        }
    }
}
```
En `clienteException.java` 

```java
package com.company;

public class ClienteException extends Exception {

    public ClienteException(String message) {
        super(message);
    }
}
```
En `Main.java`

```java
package com.company;

import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {

        // null pointer
        Cliente cliente = null;
        try {
            cliente = new Cliente("Juan","123",1000.0,500.0);
        } catch (ClienteException e) {
            e.printStackTrace();
        }

        try {
            cliente.comprar(3000.0);
        } catch (ClienteException e) {
            //Permite mostrar el error sin que el codigo rompa
            e.printStackTrace();
        }

        System.out.println("llegue hasta aca");
    }
}
```

## [⏪ Atrás](../README.md)