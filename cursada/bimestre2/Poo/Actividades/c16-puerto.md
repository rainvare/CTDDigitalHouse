<link rel="stylesheet" type="text/css" media="all" href="../styles.css" />

# Actividad C16 - Puerto

## Ejercicio

El puerto de Buenos Aires necesita administrar los contenedores que ingresan día a día.
Estos poseen un número que los identifica, un texto que describe el país de procedencia (China, EEUU, Brasil, Rusia, Canadá, Desconocida) y una marca que indica si transporta materiales peligrosos.

El sistema debe permitir que el puerto pueda ingresar contenedores, mostrarlos ordenados de acuerdo al número que los identifica y poder calcular la cantidad decontenedores peligrosos cuya procedencia sea “Desconocida”

### UML

![img](./img/c16m1.png)


En `Puerto.java`

```java
package com.company;

import java.util.ArrayList;
import java.util.List;

public class Puerto {

    private String nombre;
    private List<Contenedor> contenedores;

    public Puerto(String nombre) {
        this.nombre = nombre;
        this.contenedores = new ArrayList<>();
    }

    public void addContenedor(Contenedor contenedor){
        contenedores.add(contenedor);
        //a medida que se agregan se van ordenando por numero
        contenedores.sort(null);
    }

    public void mostrarOrdenados(){
        for (Contenedor contenedor : contenedores) {
            System.out.println(contenedor.toString());
        }
    }

    public Integer getCantidadContenedoresPeligrosos(){
        Integer peligrosos = 0;
        for (Contenedor contenedor : contenedores) {
            if(contenedor.getMaterialesPeligrosos() && contenedor.getProcedencia()=="Desconocida"){
                peligrosos ++;
            }
        }
        return peligrosos;
    }
}

```
En `Contenedor.java`

```java
package com.company;

public class Contenedor implements  Comparable<Contenedor>{

    private Integer numero;
    private String procedencia;
    private Boolean materialesPeligrosos;

    public Contenedor(Integer numero, String procedencia, Boolean materialesPeligrosos) {
        this.numero = numero;
        this.procedencia = procedencia;
        this.materialesPeligrosos = materialesPeligrosos;
    }

    public Boolean getMaterialesPeligrosos() {
        return materialesPeligrosos;
    }

    public String getProcedencia() {
        return procedencia;
    }

    @Override
    public String toString() {
        return "Numero de Contenedor: " + numero + " Procedencia: " + procedencia + " Transporta Materiales Peligrosos?: " + materialesPeligrosos;
    }

    @Override
    public int compareTo(Contenedor contenedor) {
        if(this.numero > contenedor.numero){
            return 1;
        }
        if(this.numero < contenedor.numero){
            return -1;
        }
        return 0;
    }
}
```

En `Main.java`

```java
package com.company;

public class Main {

    public static void main(String[] args) {
	
        Contenedor contenedor1 = new Contenedor(3839, "Chile", true);
        Contenedor contenedor2 = new Contenedor(1, "Desconocida", true);
        Contenedor contenedor3 = new Contenedor(389, "Colombia", false);

        Puerto puerto = new Puerto("Buenos Aires");

        puerto.addContenedor(contenedor1);
        puerto.addContenedor(contenedor2);
        puerto.addContenedor(contenedor3);

        puerto.mostrarOrdenados();

        System.out.println(puerto.getCantidadContenedoresPeligrosos());
    }
}
```
## [⏪ Atrás](../README.md)