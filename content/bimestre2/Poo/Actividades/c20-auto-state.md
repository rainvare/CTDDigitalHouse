<link rel="stylesheet" type="text/css" media="all" href="../styles.css" />

# C20 - Ejemplo Auto State

Tenemos un auto que puede sencillamente tener varios estados.

Puede estar:

1. **Apagado**: sin la llave de contacto y el motor detenido.
2. **Parado**: el motor en marcha, pero sin moverse.
3. **EnMarcha**: avanzando en el camino.
4. **SinNafta**: se le terminó el combustible.

El auto deberá tener atributos para conocer su velocidad y la cantidad de combustible que tiene cargado.

Las responsabilidades podrán ser:

1. **Acelerar**: incrementa la velocidad y consume nafta.
2. **Contacto**: sirve para encender el auto.
3. **Frenar**: le permite detenerse.

Las transiciones de estado se encuentran cuando por ejemplo:

![img](./img/c20a.png)

![img](./img/c20c.png)


En `Interface StateAuto.java`

```java
public interface StateAuto {

    void acelerar();
    void frenar();
    void contacto();

}
```

En `Auto.java`

```java
public class Auto {

    private StateAuto estado;                 
    // Estado del auto (apagado, parado, en marcha, sin combustible)
    private int velocidadActual = 0; // Velocidad actual del auto
    private int combustibleActual = 0; // combustible restante

    public Auto(int combustible)     {
        this.setCombustibleActual(combustible);
        // Estado inicial (Apagado)
        this.setEstado(new Apagado(this));
    }

    public void acelerar()       {
        getEstado().acelerar();

        System.out.println("Velocidad actual: " + getVelocidadActual() + ". Combustible  restante: " + getCombustibleActual());
    }

    public void frenar(){
        getEstado().frenar();
    }

    public void contacto(){
        getEstado().contacto();
    }

    public void modificarVelocidad(int kmh){
        setVelocidadActual(getVelocidadActual() + kmh);
    }

    public void modificarCombustible(int decilitros){
        setCombustibleActual(getCombustibleActual() + decilitros);
    }

    public int getVelocidadActual(){
        return velocidadActual;
    }

    public void setVelocidadActual(int velocidadActual){
        this.velocidadActual = velocidadActual;
    }

    public int getCombustibleActual(){
        return combustibleActual;
    }

    public void setCombustibleActual(int combustibleActual){
        this.combustibleActual = combustibleActual;
    }

    public StateAuto getEstado(){
        return estado;
    }

    public void setEstado(StateAuto estado){
        this.estado = estado;
    }
}
```

En `Apagado.java`
```java
public class Apagado implements StateAuto{
    // Referencia a la clase de contexto
    private Auto v;
    // Constructor que inyecta la dependencia en la clase actual
    public Apagado(Auto v){
        this.v = v;
    }

    @Override
    public void acelerar() {
        System.out.println("ERROR: El auto esta apagado. Efectúe el contacto para iniciar");
    }

    @Override
    public void frenar() {
        // Frenar con el auto parado tampoco sirve de mucho...
        System.out.println("ERROR: El auto esta apagado. Efectúe el contacto para iniciar");
    }

    @Override
    public void contacto() {
        // Comprobamos que el auto disponga de combustible
        if (v.getCombustibleActual() > 0){
            // El auto arranca -> Cambio de estado
            //                   estado = PARADO;
            v.setEstado(new Parado(v));
            System.out.println("El auto se encuentra ahora PARADO");
            v.setVelocidadActual(0);
        }else{
            // El auto no arranca -> Sin combustible
            //estado = SIN COMBUSTIBLE
            v.setEstado(new SinNafta(v));
            System.out.println("El auto se encuentra sin combustible");
        }
    }
}
```

En `Parado.java`
```java
public class Parado implements StateAuto{

    private Auto v;

    // Constructor que inyecta la dependencia 
    public Parado(Auto v)  {
       this.v = v;
    }

    @Override
    public void frenar()  {
    // No ocurre nada. Si ya se encuentra detenido, no habrá efecto alguno
       System.out.println("ERROR: El auto ya se encuentra detenido");
    }

    @Override
    public void contacto(){
       // El auto se apaga         estado = APAGADO;
       v.setEstado(new Apagado(v));
       System.out.println("El auto se encuentra ahora APAGADO");
    }

    @Override
    public void acelerar() {
        // Comprobamos que el auto disponga de combustible
        if (v.getCombustibleActual() > 0){
           // El auto se pone en marcha. Aumenta la velocidad y cambiamos de estado => EN_MARCHA;
           v.setEstado(new EnMarcha(v));
           System.out.println("El auto se encuentra ahora EN MARCHA");
           v.modificarVelocidad(10);
           v.modificarCombustible(-10);
        }else{
           //estado = SIN COMBUSTIBLE
           v.setEstado(new SinNafta(v));
           System.out.println("El auto se encuentra ahora SIN COMBUSTIBLE");
        }
    }
}
```

En `EnMarcha.java`

```java
public class EnMarcha implements StateAuto{

    private final int VELOCIDAD_MAXIMA = 200;

    // Referencia a la clase de contexto
    private Auto v;

    // Constructor que inyecta la dependencia en la clase actual
    public EnMarcha(Auto v){
        this.v = v;
    }

    @Override
    public void acelerar(){
        if (v.getCombustibleActual() > 0)          {
            // Aumentamos la velocidad, en el mismo estado
            if (v.getVelocidadActual() >= VELOCIDAD_MAXIMA)    {
               System.out.println("ERROR: El auto alcanzó su velocidad máxima");
               v.modificarCombustible(-10);
            }
           else{
               v.modificarVelocidad(10);
               v.modificarCombustible(-10);
            }
        }
        else{
           //estado = SIN COMBUSTIBLE
           v.setEstado(new SinNafta(v));
           System.out.println("El auto se quedó sin combustible");
        }
    }

    @Override
    public void frenar() {
       // Reducimos la velocidad. Si esta llega a 0, cambiaremos a estado "PARADO"
        v.modificarVelocidad(-10);
        if (v.getVelocidadActual() <= 0){
           //estado = PARADO;
           v.setEstado(new Parado(v));
           System.out.println("El auto se encuentra ahora PARADO");
        }
    }

    @Override
    public void contacto() {
       // No se puede detener el auto en marcha!
       System.out.println("ERROR: No se puede cortar el contacto en marcha!");
    }
}
```
En `sinNafta.java`

```java
public class SinNafta implements StateAuto{

    // Referencia a la clase de contexto
    private Auto v;

    // Constructor que inyecta la dependencia en la clase actual
    public SinNafta(Auto v){
       this.v = v;
    }

    @Override
    public void acelerar(){
        System.out.println("ERROR: El auto se encuentra sin combustible");
    }

    @Override
    public void frenar(){
        System.out.println("ERROR: El auto se encuentra sin combustible");
    }

    @Override
    public void contacto(){
        System.out.println("ERROR: El auto se encuentra sin combustible");
    }
}
```

## [⏪ Atrás](../README.md)