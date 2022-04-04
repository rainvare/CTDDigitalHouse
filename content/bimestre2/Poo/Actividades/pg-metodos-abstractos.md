<link rel="stylesheet" type="text/css" media="all" href="../styles.css" />

# Actividad PG: Metodos abstractos

Estamos modelando un zoológico y, tenemos que crear la clase animal de la que luego van a heredar todos nuestros animales del mismo. Esta va a ser una clase abstracta, ya que nunca va a existir una instancia de animal.

La única responsabilidad que van a tener los animales es hacer un ruido ya que cada uno va a hacer un sonido diferente y como no hay un comportamiento unificado va a consistir de un método abstracto.

```java
public abstract class Animal{
    public abstract void hacerRuido();
}
```


## [⏪ Atrás](../README.md)