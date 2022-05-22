---

<t>Backend</t>

---
## Índice

1. Módulo 1 - Bienvenida e Introducción
    - [C1 - Qué es backend](#c1)
    - [Patrones de diseño](#c1-1)
        - [Facade](#c1-1a)
        - [Template Method](#c1-1b)
        - [Cadena de responsabilidad](#c1-1c)
        - [Proxy](#c1-1d)
        - [Flyweight](#c1-1e)
2. Módulo 2 - Logging y acceso a datos
3. Módulo 3 - Framework para el desarollo ágil de aplicaciones


# C1 - Qué es backend<a id='c1'></a>

El **back end** es la parte de la aplicación que se encarga de toda la lógica para que la misma funcione. Algunas de las funciones que se gestionan en esta parte son:

- Las peticiones del **front end.**
- Lógica de negocio.
- Conexión con **bases de datos (relacionales y no relacionales).**
- Logueo de errores, para encontrar luego, más rápidamente las soluciones.
- Uso de librerías del servidor web, por ejemplo, para implementar temas de caché o para comprimir las imágenes de la web.
- La seguridad de los sitios web que gestiona
- Optimización de los recursos para que las páginas sean performantes.

Un **back end** debe ser capaz de tener una capa de servicios para que el **front end** pueda consumirla y así poder realizar peticiones. En el desarrollo de esta capa hay que conectarse a una base de datos y definir que le es permitido mostrar al **front end**.

# Patrones de diseño <a id='c1-1'></a>

## Facade <a id='c1-1a'></a>
![FACADE](./img/c%20(1).png)

Una fachada es una clase que proporciona una interfaz simple a un subsistema complejo que contiene muchas partes móviles. Puede proporcionar una funcionalidad limitada en comparación con trabajar directamente con el subsistema, es decir solo incluye las funciones realmente importantes para los clientes.

![FACADE ](./img/c%20(2).png

### Ventajas

- Software más flexible y fácil de expandir
- Menos uso de objetos que tratan con el cliente
- Reducimos el acoplamiento entre el cliente y los subsistemas

### Desventajas

- Vamos a tener un grado alto de dependencia en la interfaz facade.



## Template Method <a id='c1-1b'></a>

![template](./img/c%20(3).png)

![template](./img/c%20(4).png)

### Ventajas

- Los clientes pueden sobrescribir ciertas partes de un algoritmo grande para que le safecten menos los cambios que tienen lugar en otras partes
- Se puede colocar código duplicado dentro de una superclase

### Desventajas

- Posee un alto grado de dependencia en la interfaz de la fachada
- Algunos clientes pueden verse limitados por el esqueleto proporcionado por el algoritmo

## Cadena de responsabilidad <a id='c1-1c'></a>

![Cadena de responsabilidad](./img/c%20(5).png)

![Cadena de responsabilidad](./img/c%20(6).png)

### Ventajas

- Mayor flexibilidad para procesar las peticiones del cliente. Es posible agregar objetos que sepan resolver nuevas responsabilidades o modificar las actuales sin afectar al cliente.
- Menor acoplamiento. Permite que un objeto envíe una petición y sepa que va a ser tratada, pero tanto el emisor como el receptor no conocen nada del otro.

### Desventajas

- Puede ser complejo implementar la cadena, y si no está bien configurada, puede que no se cubran todas las peticiones.


## Proxy <a id='c1-1d'></a>

![Proxy](./img/c%20(7).png

![Proxy](./img/c%20(8).png)

### Ventajas

- Funciona incluso si el objeto de servicio no está listo o disponible
- Cumple con OCP: podemos introducir nuevos proxies sin cambiar el servicio o los clientes

### Desventajas

- Al agregar una capa más entre el cliente y el servicio real, la respuesta puede retrasarse


## Flyweight <a id='c1-1e'></a>

Imaginemos que tenemos el sistema, una clase con pocos atributos y la necesidad de instanciarla una gran cantidad de veces.

![Flyweight](./img/c%20(9).png)

![Flyweight](./img/c%20(10).png)

![Flyweight](./img/c%20(11).png)

### Ventajas

- Reduce una gran cantidad de peso en los datos del servidor

### Desventajas

- Consume un poco más de tiempo para realizar las búsquedas


<!-------------------------------  Módulo 2  --------------------------------------->
