<t>Especialización en Back end II <t>
----------------------

La tecnología habilita nuevos negocios y estos afectan principalmente al back end. En el camino que hemos recorrido hasta ahora, hemos aprendido a implementar reglas de negocio a través del código, utilizar patrones de diseño para mejorar la calidad de esa implementación y —en última instancia— a dar soporte en una base de datos a los requerimientos para la gestión de la información.

![](./img/ctd.png)

## Temas a desarrollar: 
- Spring Cloud Netflix
- Registro y escalamiento: Eureka
- API Gateway, Spring Cloud Gateway y Zuul
- Balanceo de carga: Spring Cloud LoadBalancer y Ribbon
- Resilience4j y Hystrix
- Comunicación entre microservicios: Feign y RabbitMQ

## Objetivos de la materia:
- Adquirir conocimientos de la arquitectura de microservicios, reconocer los casos frecuentes, ser capaces de diseñar, analizar y mejorar dichas arquitecturas.
- Conocer los problemas típicos de estas arquitecturas y sus soluciones, tales como ruteo, discovery, redundancia y escalabilidad. Aplicando las herramientas de Spring Cloud en lenguaje Java.

![](./img/modulosBack.png)

## Índice

1. Módulo 1 - Introducción a microservicios
- [¿Qué es un microservicio?](#t1) 
 - [Arquitectura monolítica](#c1)
 - [Arquitectura de microservicios](#c1a)
 - [Desafíos de los microservicios](#c2a)

- [Patrones de diseño](#t2) 
 - [Service registry](#c2se)
 - [Service discovery](#c2sd)
 - [Edge server](#c2es)
 - [Central configuration](#c2cc)
 - [Log aggregation](#c2la)
 - [Distributed tracing](#c2dt)
 - [Circuit Breaker](#c2cb)
 - [Reactive microservices](#c2rm)
 - [Centralized monitoring and alarms](#c2cmaa)


2. Módulo 2 - Framework spring cloud
- [Eureka server](#t3)  
- [Configuración en sistemas distribuidos](#t4) 
- [Invocaciones REST declarativas y balanceo de carga](#t5) 
- [ API Gateway](#t6)
- [Evaluación](#t7) 
- [API Gateway - Seguridad](#t8) 
- [Patrón Circuit Breaker](#t9) 
- [Traceo distribuido](#t10) 

3. Módulo 3 -  Mensajería asincrónica
- [Comunicación asincrónica](#t11)
- [Spring Cloud Bus](#t12)

4. Módulo 4 -  Implementación sobre docker
- [Docker y microservicios - Parte I](#t13)
- [Docker y microservicios - Parte II](#t14)
- [Evaluación final](#t15)
- [Clases especiales](#t16)


[fasf](https://view.genial.ly/60fb526757ce830d9chf)


![](./img/M2/Untitled.png)

    - # Ejes de la materia
<!--###############################################--  MÓDULO 1--#####################################################################-->
## Repaso de Backend I

Formulario de repaso

1 - El método HTTP GET por lo general se utiliza para: 
* [ ] Crear un nuevo registro.
* [X] Consultar información.
* [ ] Eliminar un registro.

2- Las clases de controlador en Spring están anotadas con @RequestMapping.
* [ ] Verdadero
* [X] Falso

3- @GetMapping es un atajo para @RequestMapping(method = RequestMethod.GET) y se utiliza para mapear solicitudes HTTP GET a los métodos de controlador asignados.
* [X] Verdadero
* [ ] Falso

4- La anotación @ResponseBody solo se puede utilizar a nivel de clase en el controlador.
* [ ] Verdadero
* [X] Falso

5- Cuando el controlador devuelve datos en una respuesta, ¿en qué formato se devuelve al cliente?
* [ ] XML
* [ ] HTTP
* [X] JSON

6- Siempre es mejor exponer entidades completas en los endpoints para evitar crear otras capas de servicios.
* [X] Verdadero
* [ ] Falso

7- La razón principal para usar un DTO es agrupar lo que serían múltiples llamadas remotas en una sola.
* [ ] Verdadero
* [X] Falso

8- Un ResponseEntity está formado por:
* [ ] Código de estado, cuerpo y conexiones.
* [ ] Código de estado y cuerpo.
* [X] Código de estado, cuerpo y cabecera.

9- Siguiendo los conceptos del patrón MVC: Las vistas se comunican de forma directa con los modelos.
* [ ] Verdadero
* [X] Falso

10- Cuando definimos una interfaz en la capa repository (o DAO), al extender de JpaRepository, solo podemos hacer uso de los métodos delete y update.
* [ ] Verdadero
* [X] Falso

## Introducción a microservicios <a id='t1'></a>
### ¿Qué es la arquitectura de software?
Es la estructura, función e interacción de un software. Un proceso creado por un arquitecto.
[](./img/que-es-la-arquitectura-de-software.jpg)
[](./img/arquitectoDeSoftware.png)

Hay dos tipos de arquitectura: monolítica y de microservicios
### Arquitectura monolítica <a id='c1'></a>
Pensemos en la evolución de las computadoras, al principio no existía la conexión entre sí, es decir, no había Internet, y dichas computadoras aún no eran personales, sino que eran grandes centros de cómputos. Claramente, esta realidad hizo que tanto los primeros programas como los subsiguientes sean autosuficientes o, en otras palabras, sean sistemas compuestos por varios módulos interrelacionados unos con otros dentro del mismo computador.

Un ejemplo de arquitectura monolítica sería:
[](./img/que-es-la-arquitectura-monolitica.jpg)

#### Algunas ventajas y desventajas de la arquitectura monolítica

- Ventajas:
 * Los errores son fáciles de detectar, porque el fallo ocurre en un único lugar dónde están todos los módulos o componentes.
 * Es menos costoso. Mantener un solo repositorio y un grupo pequeño de desarrollo reduce los costos de mantenimiento y conflictos en el código.

- Desventajas:
* Las arquitectura monolíticas están desarrolladas en un solo lenguaje de programación, por lo que al querer integrar otro lenguaje debe externalizarse los módulos o cambiar todo el lenguaje.
* El sistema se saturaría al no poder responder a la demanda agregada y tendríamos tiempos excesivos de respuesta en todas las funcionalidades, lo cual se traduce a problemas de negocio perdiendo ventas y beneficios para la organización.
* Esta arquitectura no es viable para sistemas que quieran incluir nuevas funcionalidades en el futuro.

![](./img/arqmono-vent-desventa.png)

[presentación genialy](https://view.genial.ly/60fb526757ce830d9chf)

###  Arquitectura de microservicio <a id='c1a'></a>
Esta arquitectura es la antítesis de la arquitectura monolítica, ya que no acopla funcionalidades como un todo, sino que crea pequeños componentes con una única funcionalidad acotada. Estos cuentan con autonomía en términos de recursos computacionales y dependencias como BBDD, de forma tal que su evolución es totalmente independiente a lo largo del tiempo.

Un microservicio no es necesariamente un servicio REST o SOAP, sino que se encarga de brindar un servicio particular —ya sea utilizando estos protocolos o bien de alguna otra manera—, como un procesamiento batch, la reacción a algún evento que ocurra por mensajería por cola, el procesamiento de algún archivo por FTP, etc.

![](./img//arquitectura-microservicios.jpg)

#### Algunas ventajas y desventajas de la arquitectura de microservicios

- Ventajas:
* Ante el incremento de la demanda de la app, se pueden incrementar las instancias. Es decir, la arquitectura es independiente y escalable.
*  Se potencia y optimiza el TMM (tiempo mínimo para que el producto o funcionalidad este productivo) porque se puede dar respuesta a nuevas funcionalidades sin perjudicar el sistema.
* Al ser una arquitectura distribuida con componentes totalmente independientes, pueden desarrollarse componentes en diferentes lenguajes de programación.
* Las partes que la componen son reutilizables

- Desventajas:
* Las fallas son más difíciles de identificar por lo complejo del sistema
* El debug y el descubrimiento de errores es más dificil porque cada microservicio tiene su log y contexto de ejecución, por lo cual se debe realizar la traza de invocaciones entre microservicios de forma obligatoria para poder identificar la cadena de llamados de una petición de usuario y establecer la corrección a la falla correspondiente
* El performance puede verse afectado. Porque el tiempo de respuesta es la suma de la cadena de microservicios invocados.

![](./img/arqui-micro.ventaj-desventaja.png)

[presentación genialy](https://view.genial.ly/6203f1ce255c44001af661e3)

-----------------
### MDT 1

Crear un diagrama de arquitectura de software
#### Consigna
Pensemos que somos arquitectos de software de DH Soluciones y tenemos un usuario que nos solicita un sistema para su nueva fintech. Tuvimos varias reuniones donde relevamos información, por lo cual sabemos que el sistema debe contar con las siguientes capacidades:
Poder crear nuevos usuarios identificados por documento (API de Usuarios).
Tener autenticación de usuarios por huella digital (API de Usuarios).
Poder gestionar y crear cuentas virtuales asociadas a un número de cuenta (API de Cuentas).
Realizar transferencias entre cuentas propias y cuentas asociadas a bancos (API de Transferencias).
Crear link de pagos, código QR que permitan cobrar dinero en cuenta (API de Pagos).
Poder generar inversiones como plazos fijos (API de Inversiones).

[pdf](./clases/clase%201%20-%2017%20de%20octubre%20de%202022/C1%20-%20Ejercicio%20para%20la%20mesa%20de%20trabajo.pdf)

![](./clases/clase%201%20-%2017%20de%20octubre%20de%202022/Diagrama%20sin%20t%C3%ADtulo%20(1).jpg)

### Desafíos de los microservicios <a id='c2a'></a>
- Es más *complicado* de administrar, ya que cuenta con más componentes para gestionar, monitorear y administrar.
- **Dinámica de la complejidad**: los sistemas distribuidos son *complejos de probar, de implementar y de comprender en su conjunto*. Se trata de muchos componentes que intentan trabajar todos juntos para intentar resolver un problema.
- **No caer en un “monolito distribuido”**, que dista mucho de una solución de microservicios verdaderamente desacoplados.
- **La poca experiencia del equipo desarrollador** puede dificultar la implementación exitosa de microservicios. Un ejemplo de ello puede ser la dificultad de emular ambientes cuando intentan ejecutar decenas o cientos de microservicios en un mismo entorno de desarrollo local.
- La dificultad de orquestar una **gran cantidad de microservicios**.
- La **dificultad de gestionar dependencias tanto internas como externas**.


### Patrones de diseño <a id='t2'></a>

Los patrones de diseño que vamos a ver son:

1- Service registry
2- Service discovery
3- Edge server
4- Central configuration
5- Log aggregation
6- Distributed tracing
7- Circuit Breaker
8- Reactive microservices
9- Centralized monitoring and alarms


### Service registry <a id='c2se'></a>
El patrón Service registry permite contar con la creación de un servidor centralizado, donde todos los servicios se registren al momento de iniciar. De esta manera, cada uno de los servicios le tendrá que enviar la dirección IP, el puerto en el que responde al servidor y, finalmente, el identificador de servicio (que por lo general es un nombre alfanumérico que ayuda a identificarlo). De esta forma, el servidor central o registro sabrá exactamente dónde está cada servicio disponible.

Este patrón propone que sepamos exactamente qué servicios están disponibles y su ruta de acceso. Por lo general, proporciona una interfaz gráfica que nos permite ver todo el universo de servicios que se encuentran activos.

![Service registry](./img/serviceregistry-funcion.png)

[presentación genialy](https://view.genial.ly/61eea349fb99ca0012e6d859)

Otra característica es que los servicios que se registren, deberán estar enviando constantemente una señal al registro, conocida como “latidos” (heartbeat en inglés). Esta indica que los servicios siguen disponibles al pasar el tiempo. Si no recibe esa señal, el microservicio lo marca automáticamente como fuera de servicio y puede mandar en ese momento una notificación a algún administrador o DevOps para que lo administre.

![Service registry 2](./img/service-registry-parte-2.jpg)

     Service registry es un componente indispensable en una arquitectura de microservicios porque permite que los servicios se puedan registrar independientemente de su ubicación física. Esto genera que podamos conocer su ubicación fácilmente y, posteriormente, utilizar técnicas de autodescubrimiento para localizarlos y balancear la carga. 


----- 

### Service discovery <a id='c2sd'></a>
El patrón Service registry es complementario al patrón Service discovery (ya veremos por qué), pero antes es necesario aclarar que —en arquitecturas cloud— la elasticidad es la capacidad de la nube para crecer o disminuir en recursos a medida que la demanda aumenta o disminuye. Esto permite que no sea necesaria la intervención humana y que sea posible aprovisionar nuestros servidores o ampliar la capacidad de procesamiento de los existentes a demanda.

Por lo tanto, si la nube es elástica no tiene sentido contar con un archivo de configuración fijo donde se guarden las direcciones de cada servicio porque implicaría tener una persona que continuamente esté actualizando ese archivo por cada vez que una instancia se da de alta o baja.

En la siguiente imagen, podemos apreciar que las nuevas instancias resultan desconocidas para la aplicación, a menos que alguien las agregue manualmente al archivo de configuración. Esto termina siendo algo ineficiente y altamente propenso a errores.

![](./img/service-discovery-parte-1.jpg)

Otra situación la ilustra la siguiente imagen, donde puede verse claramente cómo dos instancias del servicio dejan de responder (o simplemente se han dado de baja), dando por resultado que la aplicación se encuentre desactualizada nuevamente, e incluso termine fallando por intentar ejecutar servicios que no están disponibles.

![](./img/service-discovery-parte-2-mesa-de-trabajo-1.jpg)

Es acá donde aparece el llamado Service discovery, encargado de determinar todas las instancias activas de los servicios por medio de un registro central, el cual es nada menos que el Service registry que conocimos anteriormente.

El Service discovery es un componente que se encarga de recuperar del Service registry todas las instancias de los servicios disponibles y realizar el balance de cargas. Sin embargo, existen dos formas en las que este descubrimiento se pueda dar: del lado del cliente y del lado del servidor. Avancemos para conocer la diferencia.

![](./img/Service_Discovery_del_lado_del_cliente_y_servidor-01.png)

    El Service discovery es uno de los patrones más importantes a la hora de implementar arquitecturas de microservicios o nativas para la nube. Esto se debe a que nos permite: primero, desacoplarnos de los servidores físicos y, en segundo término, escalar rápidamente con tan solo levantar nuevas instancias. Es por ello que utilizando una estrategia de auto descubrimiento de servicios nos permite crear aplicaciones mucho más escalables, evitando la dependencia de un servicio específico, IP o puerto que se nos asigne. Esto permite el despliegue donde sea y cómo sea de todos los servicios gracias al Service discovery que, mediante el Service registry, nos es posible ubicar y balancear la carga de todas las instancias disponibles.



----

### Edge server <a id='c2es'></a>
### Central configuration <a id='c2cc'></a>
### Log aggregation <a id='c2la'></a>
### Distributed tracing <a id='c2dt'></a>
### Circuit Breaker <a id='c2cb'></a>
### Reactive microservices <a id='c2rm'></a>
### Centralized monitoring and alarms <a id='c2cmaa'></a>


 

----

<!--###############################################--  MÓDULO 2 --#####################################################################-->
## Framework spring cloud 
### Eureka server <a id='t3'></a>


### Configuración en sistemas distribuidos <a id='t4'></a>
### Invocaciones REST declarativas y balanceo de carga <a id='t5'></a>
### API Gateway <a id='t6'></a>
### Evaluación <a id='t7'></a>
### API Gateway - Seguridad <a id='t8'></a>
### Patrón Circuit Breaker <a id='t9'></a>
### Traceo distribuido <a id='t10'></a>

<!--###############################################--  MÓDULO 3 --#####################################################################-->
## Mensajería asincrónica
### Comunicación asincrónica <a id='t11'></a>

### Spring Cloud Bus <a id='t12'></a>



<!--###############################################--  MÓDULO 4 --#####################################################################-->

## Implementación sobre docker

### Docker y microservicios - Parte I <a id='t13'></a>
### Docker y microservicios - Parte II <a id='t14'></a>
### Evaluación final <a id='t15'></a>
### Clases especiales <a id='t16'></a>






