<link rel="stylesheet" type="text/css" media="all" href="../styles.css" />

# C22 - Composite Departamentos



![img](../img/c22c.png)

### Implementacion

En `interface Departamento.java`

```java
public interface Departamento {
    void getName();
}
```

Para los componentes *hoja* vamos a definir Clases para los departamentos financiero y de ventas:

En `clase DepartFinanciero.java`

```java
public class DepartFinanciero implements Departamento {
    private int id;
    private String name;

    public void getName(){
        System.out.println(getClass().getSimpleName());
    }
}
```

En `DepartVentas.java`

```java
public class DepartVentas implements Departamento {
    private int id;
    private String name;

    public void getName(){
        System.out.println(getClass().getSimpleName());
    }
}
```

```java
public class DepartComposite implements Departmento {

    private int id;
    private String name;
    private List<Departmento> childDepartments;

    public DepartComposite(int id, String name) {
        this.id = id;
        this.name = name;
        this.childDepartments = new ArrayList<>();
    }
    public void getName() {
        childDepartments.forEach(Departmento::getName);
    }
    public void addDepart(Departmento department) {
        childDepartments.add(department);
    }
    public void removeDepart(Departmento department) {
        childDepartments.remove(department);
    }
}
```
Esta es una clase compuesta que contiene una colección de componentes de clase Departamento, y también métodos para adicionar o remover elementos de esta lista.
El método compuesto `getName()` está implementado iterando sobre la lista de elementos hoja e invocando el método apropiado para cada uno.



## [⏪ Atrás](../README.md)