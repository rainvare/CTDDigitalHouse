<link rel="stylesheet" type="text/css" media="all" href="../styles.css" />

# C21 - Patron Observer

![img](../img/c21a.png)

`Interface Observable.java` : Tiene los metodos que van a ser implementados por el idol

```java
public interface Observable{
    void agregar (Observador o);
    void quitar (Observador o);
    void notificar (String msg);
}
```

`Interface Observador.java` 

```java
public interface Observador{
    void actualizar (String notificacion);
}
```
Clase `Idol.java` : Implementa observable, obliga a implementar los metodos abstractos

```java
public class Idol Implements Observable{

    private boolean enVlive;
    private ArrayList<Observador> observadores = new ArrayList<>();

    @Override
    public void agregar(Observador o){
        observadores.add(o);
    }

    @Override
    public void quitar(Observador o){
        observadores.remove(o);
    }
    @Override
    public void notificar(String msg){
        for(Observador o: observadores){
            p.actualizar(msg);
        }
    }

    //MEtodo de transmitir
    public void transmitir(){
        enVlive=true;
        notificar("Transmitiendo en vivo en www.link.com")
    }

    public void finalizarTransmision(){
        enVlive=false;
        notificar("Vlive finalizo, gracias por participar");
    }
}
```

En `Fan.java`

```java
public class Fan implements Observador{
        private String apellido;
        private String nombre;
        private String nivelFan;

    //Generamos constructor
    public Fan(String apellido, String nombre, int nivelFan){
        this.apellido = apellido;
        this.nombre = nombre;
        this.nivelFan = nivelFan;
    }

    //Aqui van los getters y setters de los atributos.

    //Se implementan los metodos abstractos de Observador
    @Override
    public void actualizar(String noificacion){
        
        System.out.println(getApellido()+", "+getNombre()+" Mensaje de tu Idol: "+notificacion);
    }
}
```

En `Main.java`

```java
public class Main{
    public statis void main(String[] args){
        Idol korean = new Idol();
        Fan fan1 = new Fan("Garcia", "Pedro", 0);
        Fan fan2 = new Fan("Garcia", "Juana", 2);

        korean.agregar(fan1);
        korean.agregar(fan2);

        korean.transmitir();
        korean.finalizarTransmision();
    }
}
```

## [⏪ Atrás](../README.md)