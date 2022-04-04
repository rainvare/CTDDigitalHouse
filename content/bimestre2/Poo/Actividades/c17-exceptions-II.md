<link rel="stylesheet" type="text/css" media="all" href="../styles.css" />

# Actividad PG: Exceptions II

Tenemos una clase cuenta con titular y saldo, los comportamientos posibles son depositar y extraer. 
- Extender la clase Exception, para generar excepciones, cuando se intente crear una cuenta con saldo negativo o se intente extraer un importe mayor al saldo. 
- Mostrar el nombre de la Excepción cuando se genera. 

La clase `Cuenta.java`

```java
public class Cuenta {
    private String titular;
    private double saldo;

    public Cuenta(String titular, double saldo) throws CuentaException{
        this.titular=titular;
        if (saldo<0)
            throw new CuentaException("No se puede crear una cuenta con saldo negativo");
        this.saldo=saldo;
    }

    public void extraer(double importe) throws CuentaException{
        if (importe >saldo)
            throw new CuentaException("No hay saldo sufieciente para esta extracción");
        saldo=saldo-importe;
    }

    public void depositar(double importe){
        saldo+=importe;
    }
}
```

**Solucion:**

```java
class CuentaException extends Exception {
    public CuentaException(){
        super();
    }
    public CuentaException(String mensaje){
        super(mensaje);
    }
    public String toString(){
        return "Se produjo la siguiente Excepción "+ this.getClass().getName() + " Mensaje: " + this.getMessage();
    }
}
```

## [⏪ Atrás](../README.md)