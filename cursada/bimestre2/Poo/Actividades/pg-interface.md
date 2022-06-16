<link rel="stylesheet" type="text/css" media="all" href="../styles.css" />

# Actividad PG: Interface

Tenemos que modelar el sistema de un juego donde varios de nuestras clases van a poder ser amigables.

Todas las clases con comportamiento amigable van a tener la capacidad de hacer amigos, en este caso nosotros tenemos la clase Persona y le tenemos que aplicar la interfaz amigable. Cuando una persona amigable hace un amigo se le incrementa la cantidad de amigos por uno y la felicidad por 10. 

Te brindamos la interfaz amigable, ahora implementala a la clase persona y sobrescribí el método hacer amigo.

```java
public interface Amigable {

    public void hacerAmigo();
}
```

`Class Persona`

```java
// implemeta la interfaz y sobrescribí el método hacerAmigo()
public class Persona implements Amigable{

    private String nombre;
    private Integer felicidad;
    private Integer cantidadAmigos;

    // constructor no borrar
    public Persona(String nombre) {
        this.nombre = nombre;
        felicidad = 100;
        cantidadAmigos = 0;
    }

    //implementa el método aca
    public void hacerAmigo(){
        cantidadAmigos += 1;
        felicidad += 10;
    }

    //getters no borrar
    public Integer getFelicidad() {
        return felicidad;
    }

    public Integer getCantidadAmigos() {
        return cantidadAmigos;
    }
}
```