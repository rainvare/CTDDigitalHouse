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
 -[De la arquitectura monolítica a los microservicios](#claseCierreM1)


2. Módulo 2 - Framework spring cloud
- [Spring Cloud Netflix](#netflix)
- [Eureka](#t3)  
    - [Registro y descubrimiento de microservicios](#c4eureka)
    - [Eureka server y eureka client](#c4eurekaserver)
    -[Spring Boot Actuator (heartbeat)](#c4actuator)
- [Configuración en sistemas distribuidos](#t4) 
- [Invocaciones REST declarativas y balanceo de carga](#t5) 
- [ API Gateway](#t6)
    - [Componentes de Spring Cloud Gateway](#componentesgateway)
    -[Implementacion Gateway](#implementaciongateway)
    -[Load balancer](#loadbalancer)
- [Evaluación](#t7) 
- [API Gateway - Seguridad](#t8) 
    - [Spring Security - OAuth 2.0](#oauth)
    - [Roles OAuth](#rolesoauth)
    - [Flujo del proceso de autorización](#flujooauth)
    -[Sobre la seguridad de los endpoints](#seguridadendpoints)
    -[Spring Security](#springsecurity)
- [Patrón Circuit Breaker](#t9) 
    -[Resilience4J](#Resilience4J)
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

-----

## Patrones de diseño <a id='t2'></a>

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

![](./img/patrones%20y%20spring%20boot.jpeg)


------

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

En muchos casos, en una arquitectura de microservicios, es necesario mostrar algunos microservicios fuera del contexto de nuestro sistema y ocultar otros del acceso externo. Aquellos microservicios expuestos al exterior deben estar protegidos ante solicitudes de clientes malintencionados. Es aquí donde juega un rol clave el componente Edge Server, a través del cual pasarán todas las peticiones provenientes del exterior.

![edge server](./img/edge-server-new.jpg)

Típicamente, un componente como este se comporta como si se tratara de un reverse proxy (proxy reverso) y puede ser integrado al Service discovery para ofrecer capacidad de balanceo de carga dinámica.

**Por lo tanto, para protegerse de solicitudes maliciosas, podemos hacer uso de protocolos estándares y buenas prácticas —tales como OAuth, OIDC, JWT y API keys—, de manera tal de saber que provienen de clientes confiables. De igual forma, los microservicios que necesiten contar con esta “capa de invisibilidad” pueden hacerse “visibles” para aquellos que requieren su servicio, teniendo configuradas oportunamente las rutas de acceso a los mismos.**



### Central configuration <a id='c2cc'></a>

Normalmente, una aplicación se implementa junto a su configuración, donde podemos encontrarnos con un conjunto de variables de entorno y/o archivos que contienen información de configuración. Ante una arquitectura basada en microservicios, es decir, con una gran cantidad de instancias de microservicios desplegados, surgen los siguientes interrogantes:

* ¿Cómo obtengo una imagen completa de la configuración que existe para todas las instancias de microservicios en ejecución?
* ¿Cómo hacemos para actualizar la configuración y, al mismo tiempo, asegurarnos de que todas las instancias de microservicios afectados adopten la misma?

![Central Configuration](./img/central-configuration.jpg)

El patrón propone una respuesta a esto agregando un nuevo componente llamado Configuration server (servidor de configuración) donde almacena la configuración de todos los microservicios, como podemos observar en el siguiente diagrama:


Al mismo tiempo, este permite centralizar toda la información en un solo lugar, incluso con diferentes configuraciones según se trate del entorno (desarrollo, testing, QA, producción, etc.).

### Log aggregation <a id='c2la'></a>

Cuando hablamos de arquitectura distribuida, uno de los problemas más frecuentes es obtener una trazabilidad de la ejecución de un servicio, ya que en este tipo de arquitecturas la ejecución de un servicio pasa por múltiples servicios. Esto dificulta comprender lo que está pasando y contar con un log detallado de lo que está sucediendo. Puntualmente, en el caso de arquitecturas como microservicios, es esperable tener múltiples instancias de un mismo componente, lo que hace aún más tedioso recuperar la traza de ejecución.

Para solucionar este problema, contamos con el patrón Log aggregation, el cual mediante un componente externo nos permite concentrar todos los logs en una sola fuente de datos que podemos consultar más adelante, sin necesidad de tener acceso físico a los servidores y sin importarnos cuántas instancias de cada componente tengamos. De esta manera, mediante este patrón, podemos encontrar los errores de una forma más eficiente, dándole una mejor atención a nuestros clientes.

![Log aggregation](./img/log-aggregation.jpg)

### Distributed tracing <a id='c2dt'></a>

Como dijimos anteriormente, uno de los principales problemas en una arquitectura distribuida es la trazabilidad de la ejecución de un proceso porque una sola llamada puede repercutir en la llamada de varios servicios. Esto implica que tengamos que ir recuperando el log por partes, es decir, tenemos que sacar cada parte del log en cada microservicio y luego unirlos, lo cual puede ser una tarea titánica y complicada. Por este motivo, es importante implementar un sistema de traza distribuido que permita unificar los logs en un solo punto y agruparlos por ejecución.

Para poder analizar los retrasos en una serie de llamadas de microservicios que cooperan, debemos poder recopilar marcas de tiempo de cuándo entran y salen solicitudes, respuestas y mensajes de cada microservicio.

Cuando un microservicio se comunica con otro envía en su petición el ID de la transacción global y el de su transacción. Si un microservicio no recibe estos ID, los genera. En el protocolo HTTP estos ID se envían y reciben a través de las cabeceras. Estos permiten correlacionar todas las trazas que emiten los diferentes procesos de los microservicios de una misma petición en la aplicación. Haciendo una búsqueda global por el identificativo global se obtiene el conjunto de trazas que han emitido los microservicios por los que ha transitado una petición.

![Distributed tracing](./img/distributed-tracing-mesa-de-trabajo-1.jpg)

**Como conclusión, debemos asegurarnos de que todas las solicitudes y mensajes relacionados estén marcados con un ID de correlación común, y que el ID de correlación sea parte de todos los eventos de registro. En función de un ID de correlación, podemos usar el servicio de registro centralizado para encontrar todos los eventos de registro relacionados.**

### Circuit Breaker <a id='c2cb'></a>

En la práctica, es habitual que, cuando algo falla, simplemente le mostremos al usuario un error de que algo salió mal y que lo intente más tarde, pero ¿qué sucede si el usuario estaba queriendo hacer una venta? ¿Estamos dispuestos a dejarlo pasar?

Con la llegada de nuevas arquitecturas distribuidas como microservicios, vinieron aparejadas muchas ventajas, pero con ello también aparecieron nuevas problemáticas que pocas veces se saben resolver con precisión. Uno de estos casos es poder identificar cuándo un servicio dejó de funcionar repentinamente para así dejar de esperar peticiones y, al mismo tiempo, hacer algo en consecuencia.

El patrón Circuit Breaker —cortacircuitos o fusible (no confundir con “cortocircuito”, en inglés short circuit)— propone una solución a la problemática anterior y permite trazar una analogía como si se tratara de un fusible (eléctrico) hogareño, el cual se funde para evitar que una descarga eléctrica afecte al circuito. En otras palabras, este patrón permite cortar de manera inteligente la comunicación con un determinado servicio cuando se ha detectado que el mismo está fallando, evitando de esta manera, que el sistema continúe fallando.

![circuit breaker](./img/circuit-breaker-mesa-de-trabajo-1.jpg)

Continuando con el ejemplo, si se tratara de una venta, ante la falla del servicio, podríamos pensar en dejar de mandarle peticiones y ejecutar un plan B en lo que el servicio se reponga. Algunas alternativas podrían ser volver a intentar realizar la venta en diferido, dejando pasar algunos minutos que definamos de manera explícita, o bien enviarlas a una cola para que sea procesada de manera asincrónica y luego sí podamos dar la confirmación de la misma al consumidor final.

Por último, el patrón Circuit Breaker puede pasar por tres estados diferentes. Cada uno de ellos afectará la forma en que funciona. Estos son: cerrado, abierto y medio abierto. Avancemos para conocer más.

![estados](./img/circuit-breaker-estados.jpg)

[presentación genialy](https://view.genial.ly/6203c277c293b60012dbd9e4)

En líneas generales, el patrón Circuit Breaker se aplica cuando un servicio depende de otro. Si otro servicio falla o tarda demasiado en responder (time-out), se vuelve a reintentar un determinado número de veces. Una vez excedido dicho número, se devuelve un error. Caso contrario, se vuelve a la operación normal.

A su vez, este patrón suele delatar problemas de diseño. Supongamos que nuestro servicio depende de un servicio de terceros que falla continuamente. Una opción es llamar al owner y pedir que lo “arreglen”, pero a veces esto no es posible. Entonces, la solución —en vez de una llamada al servicio directa— debería ser el uso de una cola de mensajes y hacer que la operación sea asincrónica.

**A modo de conclusión, el patrón Circuit Breaker es muy utilizado en procesos críticos, evitando de antemano que nuestra aplicación se vea envuelta en una gran cantidad de peticiones que sabemos que van a fallar, consiguiendo tomar una acción en consecuencia. Siempre se deberá priorizar dar respuesta del servicio, así sea de una forma diferente.**

![](./img/conclusion-circuit-breaker.jpg)

### Reactive microservices <a id='c2rm'></a>

Como desarrolladores, estamos acostumbrados a implementar la comunicación sincrónica mediante bloqueos I/O (bloqueos de entrada/salida), por ejemplo, para el caso de una API RESTful JSON sobre HTTP. El servidor que recibe alguna petición y, conforme a esta, espera dar una respuesta asigna (dentro del sistema operativo) un subproceso durante el tiempo que tome la solicitud. Ante este escenario, si aumenta la cantidad de solicitudes simultáneas, dicho servidor podría quedarse sin subprocesos disponibles. Esto puede provocar diversos problemas, que van desde tiempos de respuesta más prolongados hasta fallas en los servidores. En una arquitectura de microservicios, este problema suele empeorar aún más, ya que usualmente se involucra a una serie de microservicios cooperativos para atender una solicitud. Y cuantos más microservicios participen en la atención de una solicitud, más rápido se agotarán los subprocesos disponibles.
![](./img/reactive-microservices-new.jpg)

Por lo tanto, lo que ofrece este patrón es hacer uso de llamadas asíncronas no bloqueantes siempre que sea posible. Esto incluye las llamadas habituales a recursos muy lentos a través de la red, las llamadas a base de datos, la gestión de peticiones y —en general— todo el flujo de llamadas. De esta manera, necesitaremos utilizar programación reactiva para realizar una comunicación asíncrona óptima y correcta entre los distintos API REST de los diferentes microservicios que creamos.

![](./img/reactive-microservices-02.jpg)

Los sistemas creados como sistemas reactivos son más flexibles, poco acoplados y escalables. Esto los hace más fáciles de desarrollar y susceptibles de cambiar. Son significativamente más tolerantes ante fallos y, cuando ocurre uno, lo enfrentan con una solución pragmática en lugar de resultar un desastre.

Pensemos un ejemplo de un microservicio bloqueante y no bloqueante
Supongamos que tenemos un e-commerce con un proceso de checkout de una orden que consiste en comprobar las ofertas, comprobar el stock y comprobar el envío. Cada paso toma 1 segundo (con el servidor desocupado) y el servidor tiene capacidad para mantener 10.000 sesiones abiertas en simultáneo.

Si nuestra operación es sincrónica bloqueante, el usuario va a enviar su petición y, a los tres segundos, se ejecutarán todos los pasos. En esos tres segundos se verificará todo, pero ¿qué pasa si suceden 10.000 órdenes simultáneas? Se ejecuta correctamente la primera, la segunda tarda un poco más (porque tiene que esperar que termine la anterior) y, cuando llegamos a 5.000, el sistema se degrada y comienzan a aparecer los errores al saturarse el servidor.

Ahora, supongamos que nuestra operación es asincrónica. El servidor recibe el checkout del usuario y envía el evento a una cola de mensajes para que los servicios de ofertas, stock y entrega vayan levantando las órdenes. El usuario recibe el mensaje “su orden está siendo procesada” en una milésima de segundo y se libera el servidor. Entonces, si tenemos 10.000 órdenes y vienen 10.000 más al siguiente segundo, el sistema no se degrada. Quizás algunas órdenes “en proceso” no se cumplirán por falta de stock, pero en la práctica este caso es mucho mejor porque:

1- No se bloquea el servidor y seguimos recibiendo órdenes.
2- La ventana de stock desactualizada es muy pequeña.
3- Los proveedores tienen un margen de stock de seguridad.
4- Podemos paralelizar procesos.

![](./img/reactive-microservices-03.jpg)
### Centralized monitoring and alarms <a id='c2cmaa'></a>

Si los tiempos de respuesta observados y/o el uso de recursos de hardware se vuelven inaceptablemente altos, puede ser muy difícil descubrir la causa del problema. Necesitamos poder analizar el consumo de los recursos de hardware por microservicio. Para eso, podemos agregar un nuevo componente: Monitor service (un servicio de monitoreo), que es capaz de recopilar métricas sobre el uso de recursos de hardware para cada nivel de instancia del microservicio. Este nos permitirá:

Recopilar métricas de todos los servidores que utiliza el entorno del sistema, incluyendo servidores de escalado automático.
Detectar nuevas instancias de microservicios a medida que se lanzan en los servidores disponibles y comenzar a recopilar métricas de ellos.
Proporcionar una API y herramientas gráficas para consultar y analizar las métricas recopiladas.
Definir alertas que se activan cuando una métrica determinada excede un valor de umbral específico.

### Ejercicio playground

![](./img/ejerciciopatrones-playground.jpg)
 
### Mdt clase 2
Identificar en cada punto qué patrones de diseño podrían aplicarse en la arquitectura de microservicios propuesta y hacer un diagrama integral de la arquitectura con los patrones aplicados.

![](./clases/clase%202%20-%2019%20de%20octubre%20de%202022/mdt%202.png)

## De la arquitectura monolítica a los microservicios <a id='claseCierreM1'></a>

De arquitectura monolítica a microservicios
A continuación repasamos la evolución de las arquitecturas de aplicaciones. Primero, tenemos las aplicaciones monolíticas donde la aplicación se concibe como un solo componente. Luego, las arquitecturas orientadas a servicios que permitieron modularizar en grupos de servicios a los aplicativos. Por último, los microservicios que permiten —gracias a la evolución de las infraestructuras de contenedores y Kubernetes— un nivel mucho más granular de modularización permitiendo la gestión de dichos microservicios totalmente independientes.

![](./img/clase-cierre-de-semana-ultima.jpg)

En el siguiente mapa conceptual te mostramos las principales características y beneficios de los microservicios:
![](./img/clase-cierre-de-semana-ultima-2.jpg)

Por otro lado, de acuerdo a las características deseables en todo producto de software, te resumimos cómo se resuelve en cada una de las arquitecturas monolítica y de microservicios:
![](./img/cierre-de-semana-tabla.jpg)

Por otro lado, en el siguiente gráfico se puede observar una arquitectura con todos los patrones que aprendimos:
![](./img/clase-cierre-de-semana-ultima-3.jpg)

Por último, cada patrón que hemos aprendido se corresponde con un componente del framework de Spring Cloud. A continuación, te mostramos cómo se llama ese componente en Spring Cloud Netflix y que estaremos estudiando en cada una de las siguientes clases:
![](./img/clase-cierre-de-semana-02.jpg)


### mdt clase 3
Identificar los patrones de diseño y asociarlos con los microservicios solución propuestos.
![](./clases/clase%203%20-%2020%20de%20octubre%20de%202022/mdt-clase3.png)

----

<!--###############################################--  MÓDULO 2 --#####################################################################-->
## Framework spring cloud 
Vamos a comenzar a ver cada uno de los componentes de la solución que ideó Netflix en su arquitectura de microservicios. A continuación te invitamos a mirar este video para conocer un poco acerca de la historia de este framework y de uno de sus componentes, llamado Eureka. ¡No te lo pierdas!

## SpringCloud y Netflix <a id='netflix'></a>
En 2007 Netflix inició un camino que lo llevaría hacia la operación total en la nube. Gran parte de las aplicaciones de backend estaban desarrolladas con Java, y como parte de este proceso, Nteflix creó varias biblitecas.

- Ribbon para el balanceo de carga (Hoy reemplazado por Spring Cloud balancer)
- Eureka, para el descubrimiento de servicios
- Histrix, para la tolerancia a fallos (reemplazada hoy por Resilience4J).

![Bibliotecas creadas por Netflix](./img/springcloudnetflix1.jpg)

![](./img/componentvsnetflix.png)

Todas estas comenzaron a ser de código abierto alrededor del año 2012. En 2015 se lanzó Spring Cloud Netflix 1.0, un esfuerzo de la comunidad para unir los componentes de Netflix al usar Spring Boot. En 2018, la empresa hizó una transición a Spring Boot, y lo transformó en el principal framework de su sistema.

Spring Cloud Netflix proporciona herramientas para solucionar problemas de sistemas distribuidos a gran escala, como:

![](./img/springcloudnetflix.jpg)

### Eureka<a id='t3'></a>

Eureka es un servicio REST, cuyo objetivo es registrar y localizar microservicios existentes, informar de su localización, estado y datos relevantes de cada uno. 
¿Cómo funciona? Durante su arranque cada microservicios se comunicará con el servidor eureka para informar: si está disponible, dónde se ubica, y sus metadatos. Así, Eureka tendrá en su registro la información de todos los microservicios de un sistema. El nuevo microservicio notificará su estado cada 30 seg (heartbits), si después de tres periodos (90seg) Eureka no recibe información, lo eliminará del registro. Del mismo modo, una vez que se reciban tres notificaciones, se considerará que el servicio está disponible de nuevo.

Además, Eureka nos permite aumentar o reducir instancias de manera dinámica y transparente. y puede integrarse Eureka con un balanceador de carga, que permitirá enviar la petición a la instancia que se encuentre en mejores condiciones para procesarla.

Este tiene dos partes, server y client:

donde cada microservicio deberá configurarse como un cliente de Eureka.

![](./img/eurekacomofunciona.jpg)

-----

### Registro y descubrimiento de microservicios <a id='c4eureka'></a>

¿Qué problemas viene a solucionar?
El estilo de arquitectura de microservicios no se trata tanto de construir servicios individuales, sino de cómo hacer que las interacciones entre los servicios sean confiables y tolerantes a fallas.

En una arquitectura de este tipo, cada microservicio se encuentra en una dirección IP y un puerto, generalmente asignados dinámicamente. Esto dificulta que un cliente realice una solicitud a un microservicio que, por ejemplo, expone una API REST a través de HTTP.

Consideremos el siguiente diagrama. Tenemos un servicio con tres instancias, en la que cada una de ellas se encuentra en una ubicación diferente. ¿Cómo podría saber el cliente la dirección de cada uno de ellos?, y si vamos un paso más allá de la dirección, ¿cómo podría saber cuál es la instancia con menos carga para procesar la petición enviada?

![](./img/eureka-registro-y-descubrimiento-micro-servicios.jpg)

Ante este problema, debemos agregar un nuevo componente a nuestra arquitectura que nos permita:

* Registrar automáticamente los microservicios y sus instancias, tan pronto como se encuentren ejecutando y eliminarlas del registro en cuanto dejan de ejecutarse o dejan de responder.
* El cliente debe ser capaz de enviar una solicitud a los microservicios sin conocer su ubicación.
* Las solicitudes a las instancias de un microservicio deben poder ser equilibradas mediante un balanceador de carga.

En Spring Cloud este componente es Eureka, el cual veremos en detalle a continuación, pero antes te queremos contar de dónde proviene la palabra. Todo comienza cuando a Hierón II le obsequiaron una corona y quería saber si era de oro o si tenía partes que no lo eran, entonces, le instruyó a Arquímedes que haga un invento para tal fin. Este no encontraba la solución y el tiempo lo apremiaba. Entonces, tomó un baño y notó cómo el agua se desplazaba en función de su densidad. Así se le ocurrió que podría aplicar el mismo principio a la corona. Es así como cuenta la anécdota que salió corriendo gritando ‘’Eureka’’ (lo encontré).

### Eureka Server y client <a id='c4eurekaserver'></a>
Podemos dividir Eureka en dos grandes componentes: Eureka client, el encargado de publicar la información del microservicio en el que se encuentra; y Eureka server, el encargado de recopilar la información de todos los clientes.

![](./img/arquitectura-eureka-server-01.jpg)

### Monitoreando la salud de nuestros microservicios con Spring Boot Actuator (heartbeat)<a id='c4actuator'></a>
En un ecosistema de microservicios e instancias es necesario llevar un control de los mismos, ya sea por errores, para balanceo de carga o incluso para analizar métricas para determinar si necesitan más instancias de un servicio en particular.

Puede haber varios escenarios de problemas en una instancia, pero los más comunes son errores por excepción de aplicación, timeout y errores de instancia. Los errores de aplicaciones son las excepciones programadas. Los de instancia puede ser, por ejemplo, que la instancia se quede sin espacio en disco o sin memoria. Mientras que los errores de timeout suceden cuando la respuesta llega después de un determinado umbral.

Obviamente, no se puede monitorear cada endpoint y mandar datos “inertes” cada vez. En la práctica se utilizan endpoints especiales que devuelven información crítica respecto del estado de la instancia y el servicio.

La solución que ofrece el framework de Spring para este problema es Spring Actuator, que básicamente genera los endpoints necesarios para este monitoreo de manera automática. A su vez, las respuestas de estos endpoints pueden ser “sondeadas” por balanceadores de carga u otras aplicaciones para administrar el tráfico, tales como Eureka.

Spring Boot Actuator ofrece funcionalidades listas para un entorno de producción que supervisan nuestra aplicación, recopilan métricas, comprenden y analizan el tráfico y el estado de nuestra base de datos. Todo esto sin necesidad de tener que implementarlo por nuestra cuenta.

Los Actuators se utilizan principalmente para exponer información operacional sobre nuestra aplicación en ejecución (health, metrics, info, dump, env, etc.) a través de una API REST.

![endpoints](./img/actuator-endpoints.jpg)


Por defecto, solo el endpoint /health está habilitado para consumirlo, para habilitar el resto tenemos que configurar la siguiente propiedad en application.properties:

management.endpoints.web.exposure.include=serviceregistry,health,info

Por ejemplo, con esta configuración estamos habilitando los endpoints /serviceregistry, /health e /info. En caso de querer habilitar todos, ingresamos:

management.endpoints.web.exposure.include=*

Si querés conocer más sobre los endpoints que ofrece Actuator, te recomendamos ingresar en el siguiente link.

Por otro lado, Eureka server utiliza los endpoints /health e /info para obtener información sobre los microservicios. Por defecto, si realizamos una solicitud HTTP mediante el método GET al endpoint /health, nos responderá:

***
{

"status" : "UP"

}
***

En el caso de /info, podemos personalizar la respuesta configurando ciertas propiedades, por ejemplo:

info.app.name=mi-servicio
info.app.description=Servicio probando Eureka
info.app.version=1.0.0

La respuesta será:

*** 
{
"app" : {
"version" : "1.0.0",
"description" : "Servicio probando Eureka",
"name" : "mi-servicio"
}
}
***

Dependiendo de la versión de Actuator, es posible que el endpoint /info no esté habilitado por defecto para leer las variables cargadas desde el archivo application.properties. Para habilitarlo debemos agregar lo siguiente en dicho archivo:

management.info.env.enabled = true

¿Cómo agregamos actuator a nuestro proyecto?
Para hacerlo debemos utilizar Maven:

    

<dependency>
    <groupid>org.springframework.boot</groupid>
    <artifactid>spring-boot-starter-actuator</artifactid>
</dependency>
    

  
Posteriormente, actualizamos las dependencias, ejecutamos el proyecto y ya tendremos los endpoints listos para consumir.
### Ejercicio Asincrónico clase 4
Para practicar lo visto durante esta clase, te proponemos realizar el siguiente ejercicio.

**Objetivo**: Ejecutar Eureka server para el registro y descubrimiento de microservicios.

**Consigna**: Para la página web de un importante diario nos solicitan el desarrollo de una API que nos informe la cotización de diferentes monedas.

Nuestro tech lead nos pide:

- Crear un servicio nuevo y configurar Eureka server.
Configurar para que su ejecución sea en el puerto 8761.
- Crear un servicio que nos retorne la cotización actual de una moneda con respecto a otra.
- Configurar el nombre del servicio como currency-converter-service
- Crear un endpoint que reciba dos parámetros: from y to. Este endpoint deberá retornar la cotización de la moneda dada. Por ejemplo, una petición mediante el método GET a http://localhost:8080/converter?from=USD&to=ARS podría responder: 104,76. Por el momento, retornar un número aleatorio.
- Configurar Eureka client en el servicio creado anteriormente.
- Ejecutar Eureka server junto con el microservicio y visualizar en el dashboard el listado de servicios registrados.

¡Manos al teclado!

### Configuración en sistemas distribuidos <a id='t4'></a>

Introducción a la problemática de las configuraciones
Pensemos en una organización que comienza a crecer en términos de escala, por ende, comienza a desarrollar microservicios atómicos que dan soporte a los distintos procesos de negocio. Estos microservicios que proveen la infraestructura, el procesamiento y el soporte de datos necesitan de diferentes tipos de configuraciones para funcionar, por ejemplo:

- Localización de otros microservicios.
Paths de base de datos y endpoints de los servicios que se desplegarán.
- Dirección IP de servidores de almacenamiento, tales como FTP o S3.
- Tipo de logging de información por Log4j (INFO, ERROR, DEBUG).
- Contraseñas y/o secretos (en la práctica se aplica seguridad adicional en este caso).
- Variables de entorno.

Pero… ¿Por qué esta información necesita una configuración en particular y no puede estar como constantes dentro de una aplicación? Veamos cuáles son las razones.

![](./img/config-sist.jpg)
[presentación genialy]()

### ¿Qué solución nos puede brindar Spring Cloud para las configuraciones distribuidas?

Spring Cloud config es el módulo de Spring que nos permite centralizar la configuración de los sistemas. Y se crean para cada servicio que requiera externalizar información para no afectar la intregridad de la aplicación al momento del deploy. ara esto, nos brinda dos componentes básicos: Spring Cloud Config Server y Spring Cloud Client. Estos interactúan entre sí para lograr su cometido, como vemos en el siguiente diagrama:

![](./img/solucion-con-spring-cloud-config-01.jpg)

-----
### Ejercicio Asincrónico clase 5
¡A poner en práctica lo aprendido!
Basados en la lógica de negocio vista en la clase 3, relacionada con las maquinarias de construcción, nos piden agregar las siguientes configuraciones en los microservicios de usuarios y máquinas:

- Cantidad máxima de login incorrecto de usuarios: 3.
- Dominios de correos habilitados para alta: @outlook.com, @gmail.com, @digitalhouse.com.
URL de servicio de registro de vehículos: https://www.dnrpa.gov.ar/portal_dnrpa.
- Cantidad máxima de maquinaria en catálogo según playa de estacionamiento: 650.
Se pide:

Importar los ZIP de los proyectos de maquinaria y usuarios.
Crear en Git un repositorio para los servicios de usuarios y maquinarias especificando las configuraciones pedidas.
Crear el servidor de configuraciones relacionándolo con el repositorio Git.
Asociar los proyectos de maquinaria y usuario con el servidor de configuración.
Crear un endpoint REST en cada servicio con el nombre “/config” que muestre las dos configuraciones de cada proyecto.

¡Éxitos!
---- 

### Invocaciones REST declarativas y balanceo de carga <a id='t5'></a>

## Introducción a Feign
### ¿Qué son las invocaciones declarativas?
Las invocaciones declarativas han sido creadas para facilitar la integración entre microservicios mediante la creación de clientes HTTP de forma declarativa. Esto significa que se simplifica la invocación entre estos microservicios. El desarrollador simplemente necesita crear una interfaz y configurarla mediante anotaciones. No se necesita programar toda la lógica de conexión e invocación de una API, sino que simplemente se declara escribiendo anotaciones en los métodos que necesitamos invocar y/o exponer.

Feign nos servirá para hacer invocaciones declarativas y es un componente que originalmente fue desarrollado por Netflix. Actualmente, se integró dentro de los componentes de Spring Cloud, rebautizado como Spring Cloud OpenFeign. Gracias a la integración con Spring Cloud, dentro de sus ventajas podemos destacar:

- Autodescubrimiento: utilizando Eureka, podemos hacer llamadas a los microservicios utilizando el nombre en lugar de una URL formada por IP y puerto.
- Balanceo de carga: podemos integrar Feign con un balanceador de carga como Spring Cloud LoadBalancer.

[Ver guía de configuración](./clases/config-guias/ConfiguraciónFeign.pdf")

## ¿Qué es el balanceo de carga?
Según lo visto, podemos mencionar que el balanceo de carga es el proceso de distribuir el tráfico a través de diferentes instancias de la misma aplicación.
[](./img/balanceo-de-carga-01.jpg)

Para crear un sistema tolerante a fallas es común ejecutar múltiples instancias de cada aplicación. Por lo tanto, cuando un servicio quiera comunicarse con otro que tiene varias instancias en ejecución, necesitaremos de un mecanismo que nos ayude a elegir la instancia más adecuada para recibir la petición.

¿Cómo funcionan los balanceadores de carga?
Los balanceadores de carga utilizan diferentes algoritmos para elegir la instancia más adecuada. Existen muchos algoritmos, algunos de los más utilizados por los balanceadores de carga son:
[](./img/ejemplos-de-balanceo-de-carga_Mesa-de-trabajo-1.jpg)

Para cerrar, podemos mencionar que utilizar un balanceador de carga es una parte esencial a la hora de construir sistemas tolerantes a fallos. Usando Spring Cloud Load Balancer podemos elegir diferentes técnicas de balanceo para distribuir la carga a través de las diferentes instancias.

Para comunicar servicios REST, siempre necesitaremos de un cliente REST. Utilizar Feign —además de permitirnos comunicarnos— nos ofrece las ventajas de integrarse con Eureka para hacer completamente transparente la comunicación al desacoplarnos de una dirección física.

### Ejercicio Asincrónico clase 7
¡A practicar!
Para la plataforma online de educación, en donde los usuarios adquieren un plan y pueden acceder a diferentes cursos, nos solicitan migrar algunos de sus servicios a Java utilizando Spring Cloud.

Para esta etapa vamos a empezar con el microservicio encargado de gestionar los diferentes Planes/Suscripciones y con el microservicio encargado de gestionar los cursos.

Servicio de suscripciones:
Este servicio cuenta con dos entidades —suscripción y plan—, en donde la suscripción tiene un plan. Detalle:

Plan
Id
name
price
Subscription
id
startDate
endDate
plan
userId

Nuestro tech lead nos pide:

- Crear un proyecto y configurarlo con Eureka server.
- Crear el servicio de suscripciones y configurarlo con Eureka Client.
- El nombre con el que se registrará en Eureka deberá ser subscripcion-service.
- Exponer una API que nos permita buscar una suscripción pasándole como parámetro el ID de usuario.
- El endpoint deberá ser /subscription/find y como parámetro userId. Ejemplo: http://localhost:8081/subscription/find?userId=1.
- Implementar JpaRepository con H2 como base de datos (opcional).
Servicio de cursos:

Este servicio también cuenta con dos entidades —curso y capítulo—, en donde cada curso tiene un listado de capítulos. Detalle:

Course
id
name
chapters
Chapter
id
name
urlStreaming
course


Nuestro tech lead nos pide:

- Crear el servicio de cursos y configurarlo con Eureka Client.
- -El nombre con el que se registrará en Eureka deberá ser course-service.
- Exponer una API que nos permita obtener un curso mediante el ID.
- El endpoint deberá ser /courses/{courseId}.
- Además, este endpoint recibe por header el ID del usuario.
- Antes de buscar el curso, validar que el usuario tenga una suscripción activa al momento.
- Utilizando Feign buscar la suscripción del usuario (microservicio de suscripciones) y validar que se encuentra activa comparando la fecha actual con la fecha de inicio y fin de la suscripción. En caso de estar activa, retornar el curso. Si no está activa, retornar un mensaje.
- Implementar JpaRepository con H2 como base de datos (opcional).

### API Gateway <a id='t6'></a>

La solución de Spring Cloud nos provee de un framework llamado Spring Cloud Gateway que implementa el patrón Edge Server y nos brinda varias herramientas para aprovechar este punto en común de comunicación con el ecosistema de microservicios desde sistemas externos.
[ejemplo gateway](./img/intro-api-gateway.jpg)

Recordemos nuestra Fintech de DH que vimos en la primera clase y analicemos la forma de comunicación de la solución.
[ejemplo fintech](./img/ejemplo-fintech-dh-01.jpg)

Como podemos apreciar en la imagen, tenemos dos canales de comunicación: uno público y otro privado. El canal violeta —o seguro— está compuesto por las comunicaciones internas entre microservicios en puertos diferentes al 8080, sobre el cual no tienen acceso desde fuera de la red. Por esta razón, un front end no podría invocar a estos servicios de forma directa. Mientras que el canal amarillo —o público— es utilizado para dar acceso desde nuestro Cloud Gateway al mundo exterior. 

A continuación, veamos algunas de las ventajas de esta arquitectura.
[genialy api gateway](https://view.genial.ly/621045cb6ad65900195e681c)

## Componentes de Spring Cloud Gateway <a id='componentesgateway'></a>
[genialy api gateway](https://view.genial.ly/620ebdf5441b710019f0201c)

## Implementación de Spring Cloud Gateway <a id='implementaciongateway'></a>
La implementación la vamos a realizar sobre la base de dos microservicios de nuestra Fintech DH: el microservicio de usuarios y el de productos. Tomamos como punto de partida el siguiente diagrama para implementar los componentes que vimos teóricamente.
[implementación](./img/implementaci%C3%B3n-de-spring-cloud-gateway2-01.jpg)

[Guía de configuración](./clases/config-guias/Configuraci%C3%B3n%20de%20proyecto%20gateway.pdf) 

## Ejercicio Asincrónico clase 8
¡A practicar!
La gerencia de arquitectura de DH Fintech necesita comenzar a agregar tareas relacionadas con cross-cutting concerns en todos sus microservicios. Para esto nos solicita agregar Spring Cloud Gateway a los microservicios de productos y usuarios que se encuentran en el ZIP adjunto. Debemos encapsular los endpoints de estos dos microservicios bajo el puerto 8090.

¿Qué debemos hacer?

Identificar los servicios a agregar analizando el código.
Identificar las rutas adecuadas para esos servicios. Estas deben tener sentido semántico —por ejemplo, en los servicios de “Productos”, la ruta no debería ser “/cursos”—. Recordar la buena práctica de que las rutas sean en plural (salvo excepciones), respetar los parámetros de las rutas —cuándo va en la ruta y cuándo en el querystring, es decir, “/productos/12” o “/product?id=12”—.
Una vez que se tienen identificadas las rutas, analizar la forma más eficiente y clara de aplicar los filtros.
Impactar lo resuelto en los pasos anteriores en los distintos archivos de código y configuración.
A continuación, compartimos un diagrama de ejemplo de una aplicación. Podemos observar que los distintos clientes entran por el API Gateway y, a su vez, este redirige a cada microservicio. Podemos hacer un gráfico similar para el ejercicio y, a continuación, hacer las rutas.

[](./img/ejercicio-clase-api-gateway--8A.jpg)
[](./img/Cross-cutting-concern-8A.jpg)

## Load balancer <a id='loadbalancer'></a>
La mejor alternativa para manejar el balanceo de carga es agregando una capa de balanceo de carga del lado del servidor. De esta manera, solo el cliente conoce la URL del servidor de balanceo de cargas e internamente se realiza el balanceo.

[](./img/load-balancer-mesa-de-trabajo-1.jpg)

Con esta arquitectura las ventajas están a la vista. El cliente solo debe de ejecutar una única URL, donde, si agregáramos una nueva instancia al clúster, solo tenemos que actualizar el Load balancer y para las aplicaciones sería algo transparente, ya que no se enterarán del cambio. Además, podemos realizar el balanceo de la carga mediante el algoritmo que determinemos que mejor se adapta y, de esta forma, estamos seguros de que la carga se distribuye adecuadamente entre todos los servidores.

Por último, conseguimos incrementar la seguridad, ya que solo exponemos a Internet (red pública) el balanceador de cargas, mientras que el resto de los servicios pueden estar en una red sin salida a Internet. Esto disminuye la posibilidad de un ataque desde fuera de la red.

## Ejemplo de acciones tomadas por una compañía
A continuación te mostramos las decisiones de infraestructura que una start-up fue tomando a lo largo del tiempo. Estas comienzan a ser posibles gracias a una arquitectura basada en microservicios:

Día 1: La compañía contrata una instancia de AWS con un objetivo claro en todas las start-ups: salir rápido a producción. Implementa su aplicación y base de datos. La primera semana tienen 0 usuarios.

Día 90: La compañía tiene 1000 usuarios. Se comienza a implementar gran cantidad de nuevas funcionalidades solicitadas por los usuarios. Por ahora, sin cambios de infraestructura. El crecimiento es del 30% mensual.

Día 180: La compañía a esta altura logra crecer a 2000 usuarios. El servidor se empieza a quedar sin capacidad. Se adquiere más memoria/CPU/disco (escalamiento vertical).

Día 360: El crecimiento comienza a dispararse, se llega a 26.000 usuarios y ya no es posible seguir escalando, es decir, seguir agregando memoria y procesamiento al mismo servidor. La compañía necesita adquirir otro servidor para balancear la carga (escalamiento horizontal).

## API Gateway
A continuación repasaremos las características y funcionalidades que ofrece Spring Cloud Gateway.
[características](./img/caracteristicas-spring-cloud-gateway.jpg)

### Evaluación <a id='t7'></a>
[Ver parcial](https://github.com/rainvare/esp-back-i-parcial)
### API Gateway - Seguridad <a id='t8'></a>
En clases anteriores, presentamos qué es API Gateway, pero aquí hablaremos más específicamente sobre autenticación, Spring Cloud y Spring Security.

Retomando qué es el API Gateway
El mismo nombre de este recurso ya anticipa su funcionalidad: en español, gateway significa “puerta de entrada”. Situada entre el cliente y los servicios del back end, API Gateway actúa como un proxy inverso que filtra el tráfico de todas las solicitudes y dirige los datos y las llamadas a la ubicación adecuada.

El gateway actúa como un mecanismo de seguridad que garantiza la protección a través de la autenticación de los usuarios, limitando las conexiones y los permisos de los usuarios. Esto facilita el control de acceso al back end y al servicio web, ya que centraliza las solicitudes en un único punto de entrada, lo que permite enrutar el tráfico. Además, la API de negocio se vuelve menos compleja y mucho más sencilla de mantener, ya que la función de control de acceso se concentra en la API del gateway.
## Spring Security - OAuth 2.0 <a id='oauth'></a>
Intuitivamente, podemos relacionar el nombre OAuth 2.0 con autenticación y seguridad. OAuth es un protocolo estándar para la autorización, permite que las aplicaciones web, móviles y de escritorio obtengan acceso limitado a la información del usuario a través del protocolo HTTP. Puede considerarse un marco de autorización que tiene un estándar abierto para la autenticación en sistemas que usan HTTP. Empresas muy grandes y famosas —como Twitter, Google, Facebook y GitHub— utilizan esta tecnología.

Es común encontrar el uso de esta tecnología en las pantallas de inicio de sesión, por ejemplo, en los sitios web de las empresas mencionadas anteriormente. Sin embargo, nos encontraremos mucho con este protocolo en la autenticación de APIs, donde se deberá generar un token para poder acceder a estas, de una forma segura y eficiente.

## ¿Por qué OAuth?
En la práctica, la mayoría de los sitios tienen sus propios mecanismos de autenticación (cuando se registran les pide un correo y una contraseña). Pero, por otro lado, también permiten loguearse con las credenciales de otros proveedores (Google, por ejemplo). Muchos usuarios usan el segundo mecanismo y, a su vez, a las empresas les conviene desde el punto de vista de negocio, porque automatizan el proceso de onboarding (ingreso de usuarios a una nueva plataforma) y, desde el punto de vista tecnológico, delega el proceso de autenticación —con sus costos y riesgos asociados— en un proveedor validado.

[](https://view.genial.ly/623087fdee2eb40011314b37)

## Roles de OAuth <a id='rolesoauth'></a>
A continuación conoceremos los roles de OAuth.
[roles](./img/Los-4-roles-del-OAuth-2.0.jpg)

## Flujo del proceso de autorización <a id='flujooauth'></a>
Ahora que conocemos los pilares que estructuran OAuth 2.0, comprendamos el flujo durante el proceso de autorización. Sin embargo, recordemos que el flujo que se muestra es una descripción general, ya que puede ser un poco diferente según el tipo de concesión de autorización y el uso. Para comprenderlo, hagamos un repaso de los conceptos de autenticación y autorización:

Autenticación: es el proceso que determina que un usuario es quien dice ser.
Autorización: es el proceso que determina que un determinado usuario puede ejecutar determinada acción.
En la práctica, un usuario provee un usuario, una contraseña y, en algunos casos, una segunda contraseña (llamada segundo factor de autenticación). A partir de esto, se obtiene un token de sesión (un string encriptado) que se verifica en el server. El “uso malicioso” de este token se conoce como session hijacking.

Respecto de la autorización, proceso posterior a la autenticación, cada vez que se recibe un request se obtiene un objeto con los datos del usuario asociado a esa sesión. Entre estos datos vienen los denominados claims o permissions que son por lo general strings con un determinado protocolo, por ejemplo, JWT. En la práctica, estos permisos no son otra cosa más que “roles”, a los usuarios se les asignan estos roles y las aplicaciones o microservicios controlan que un usuario tenga uno o más roles según el caso.

A continuación, veremos el flujo del proceso de autorización de OAuth 2.0.

[](https://view.genial.ly/622f73407f06120011d379b9)

### Sobre la seguridad de los endpoints <a id='seguridadendpoints'></a>
En primer lugar, veamos cómo es el flujo de un request asumiendo que ha pasado todos los controles de seguridad.
[](./img/Sobre_la_seguridad_de_los_endpoints.png)

Este tipo de diagrama se conoce como diagrama de secuencia UML. Por lo general, las fechas tienen llamadas a métodos. En la práctica, el microservicio no es una caja negra y, además, la base de datos es parte del microservicio. Veamos cómo sería en detalle en la práctica.

[](./img/Sobre_la_segurida_de_los_endpoints.png)

De acuerdo a lo visto en el gráfico, podemos apreciar que el gateway recibe un request a una determinada ruta y este conoce a qué instancia de microservicio redirigir dicho pedido. Este accionar, el gateway, lo realiza a través de un manejador de rutas (RouteHandler), el cual a su vez deriva el pedido a un controlador (Controller) que es quien finalmente invoca al servicio de negocio solicitado.

Luego, como en toda aplicación en capas, la capa de servicios realiza las transformaciones (DTO) y validaciones de negocio necesarias para enviar a la capa de datos solo la información que necesita. La capa de datos traduce la información recibida en sentencias SQL para ser enviada a la base de datos (patrón DAO).

De la misma manera, la respuesta genera el camino inverso. La base de datos responde a la capa de datos la petición generada a través de la sentencia SQL recibida. Luego, esta la envía a la capa de servicios, para finalmente dirigir la información al controlador, quien transforma la información recibida en un response y devuelve esta respuesta al origen que —a los ojos de quien generó la petición— es el gateway.

### Seguridad
En el diagrama anterior, vimos con cierto detalle el camino con el que se ejecuta un request. Cuanto más se acerque un request a la base de datos, más costoso es en términos de consumo de recursos.

Si pensamos en la seguridad como un filtro, el punto más claro para aplicar seguridad es el gateway. Esto no es absoluto, pero es el caso típico, si un usuario exterior solo puede acceder por el gateway no tiene sentido aplicar seguridad en los microservicios individuales. No obstante, los riesgos se miden de acuerdo a “probabilidad x impacto”, e incluso existen ciertas regulaciones (SOX, por ejemplo) y buenas prácticas. Esto sugiere que se pueden aplicar controles redundantes de seguridad a fin de mitigar riesgos. Por ejemplo, que un endpoint en el gateway tenga un fallo de seguridad que permita pasar un request a los microservicios sin autenticación. Este tipo de fallo se conoce como “back door”.

Otro caso típico son controles en la base de datos, la restricción de ciertos comandos e incluso backups y rollbacks de transacciones no autorizadas. Supongamos un usuario ya logueado que en un campo de texto logra hacer un ataque de SQL injection. El request, al estar autenticado, pasaría el firewall e iría hasta la base de datos, entonces, es necesario aplicar un “DROP ALL TABLES”.

En esta clase vamos a ver cómo aplicar oAuth sobre un gateway de Spring.

## Spring Security <a id='springsecurity'></a>
Repasando lo visto en clases anteriores, el mecanismo de seguridad por default de Spring es Spring Security. Este provee mecanismos de autenticación (un usuario es quien dice ser), autorización (un usuario determinado puede ejecutar determinadas acciones) y gestión de tokens de sesiones. Existen diferentes maneras de representar esto, pero en la práctica terminan siendo una serie de tablas en la base de datos que contienen la información de los usuarios y sus permisos. La magia de Spring permite gestionar esa información de manera automática, lo que se traduce en logins, permisos, accesos, ABM de usuarios, etc.

## ¿Cómo funciona la autenticación vía web?
Cada vez que usamos el navegador y abrimos una página web, internamente hacemos un request contra esa página. Al hacer esa petición, además de la ruta y los parámetros, el navegador envía información en forma de “headers”, que no son más que valores “key-value” que pueden ser leídos por quien recibe la petición. Hay varios tipos de headers: de idioma, de locación, de manejo de caché, pero a nosotros nos interesan los de seguridad.

Entre esos valores tenemos el header “authorization”, el cual posee dos valores (separados por un espacio, recordemos que el valor es un string encodeado): el primero es el tipo de autenticación y el segundo serían las credenciales. Hay muchas implementaciones y estándares, e incluso estas implementaciones se suelen customizar por temas de seguridad y performance.

El caso más sencillo sería pedir usuario y contraseña, guardarlo del lado del cliente y enviarlo encodeado con cada request sin encriptar. Efectivamente, este tipo de autenticación se llama justamente “basic”. Header de ejemplo:
```cmd
Authorization: Basic AXVubzpwQDU1dzByYM==
```
Esto es muy inseguro, ya que cualquiera que pudiera leer los headers automáticamente tendría el user y el password del usuario.
Entonces, el próximo paso sería que en el server se genere un token, el cual por lo general es una función hash (si recuerdan de Java, la función hashCode genera un string único a partir del valor de las propiedades de un objeto), entonces, cuando el usuario se loguea la primera vez, el server le devuelve el token que debe usar de ahora en adelante. Este tipo de autenticación se llama Bearer.
```cmd
Authorization: Bearer
```
Supongamos que tenemos varias aplicaciones (o varias APIs) y queremos diferenciar el acceso a una API u otra. Entonces, empezamos a jugar con otro parámetro que entra en combinación con el anterior. Este tipo de autenticación se conoce como autenticación por API Key.
```cmd
X-API-Key: abcdefgh123456789
```
Vamos avanzando un poco más. En los casos anteriores, había que enviar usuario y contraseña en texto “planos” (no es estrictamente así, pero a fines ilustrativos supongamos que sí) al menos una vez y almacenarlos de la misma manera. De esta forma, el servidor debería conocer nuestro password. Pero ¿podríamos hacer que el servidor no sepa nuestro password y aun así poder autenticarlo? Volvamos al principio de la función hashCode de Java. Recuerden que —cuando vieron objetos— si sobreescribían la función equals, debían hacer lo mismo con la función hashCode, porque “objetos iguales deben devolver el mismo hashcode”. Entonces, siguiendo ese razonamiento, si yo tengo dos strings y quisiera saber si son iguales, podría hacerlo comparando tan solo sus hashcodes. Por lo que no tendría que conocer las strings originales. Este mecanismo se llama digest. Les compartimos un request de ejemplo:
```cmd
Authorization: Digest username=”admin” Realm=”abcxyz” nonce=”474754847743646”, uri=”/uri” response=”7cffhfr54685gnnfgerg8”
```
Este mecanismo es un poco más complejo que los otros, olvidémonos del parámetro URI que es la dirección de retorno. Veamos a continuación cómo funciona.

[](https://view.genial.ly/6230bfeb7b9c2000197bfbe9)

## Ejercicio Asincrónico clase 13
¡A practicar!
La autenticación es el acto de confirmar que algo o alguien es auténtico, es decir, una garantía de que cualquier afirmación de o sobre un objeto es verdadera. En este ejercicio, crearemos una aplicación que se encargará de autenticar al usuario que accederá a un sistema que se está creando.

Imaginemos que necesitamos crear un sistema para una tienda de smartphones, en el cual tendremos dos tipos de usuarios: uno que será nuestro cliente y tendrá acceso a nuestra tienda, y otro será específico del sistema que tendrá acceso a nuestro back end. Para poder realizar esta actividad, en nuestra aplicación Spring, es necesario importar los siguientes recursos:

Spring Web Starter
Spring Security
Como mencionamos, un punto importante es que esta aplicación tendrá dos tipos de usuarios:

Uno que tendrá acceso a nuestro back end (que sus rutas en la API sean /backend/**).
Otro que tendrá acceso a nuestro sistema, cada uno con sus dependencias (rutas /frontend/**).
Deberemos seguir los siguientes pasos:

Crear microservicio “frontend” (ruta /frontend/**)
Endpoints:
Ver listado de productos -> **/frontend/products (pueden hardcodear la respuesta) (GET)
Mi perfil (mostrar el user del usuario) -> **/frontend/users/{id} (GET)
Mostrar productos de una categoría -> **/frontend/product/{category} (GET)
Crear microservicio “backend” (ruta /backend/**)
Endpoints:
Ver listado de productos -> /backend/products (GET)
Ver listado de usuarios -> /backend/users (GET)
Alta producto -> /backend/products (POST)
Configurar estos servicios para utilizar un perfil u otro.
Crear los usuarios mencionados, uno con perfil “backend” y otro “frontend”..
Que el perfil “backend” también pueda acceder a los servicios “frontend”.
Observaciones:

Hardcodear las respuestas al principio, la clave del ejercicio es la seguridad.
Una vez que tengan los servicios con autenticación es un plus darle funcionalidad.
El caso de prueba ideal es que el usuario “backend” dé de alta un producto y el usuario “frontend” lo vea en una lista.
Utilizar la siguiente información:

Usuario de acceso a API: “userAPI” y contraseña: “user123”.
Usuario de acceso al portal: “clienteSmartTienda” y contraseña: “cliente123" con el papel de “CLIENTE’’.


### Patrón Circuit Breaker <a id='t9'></a>

## ¿Qué es la tolerancia a fallas?
Cuando pasamos de construir sistemas monolíticos a microservicios, una de las primeras cosas que notamos es que cada uno de los componentes que se encuentran en nuestro ecosistema de microservicios es parte de una red. Y comunicarnos a través de una red puede traernos problemas que antes ignorábamos, ya que pasamos de tener una única aplicación en ejecución a varios componentes independientes que tienen que trabajar en conjunto para garantizar el correcto funcionamiento del sistema. Cuando hablamos de tolerancia a fallas en sistemas distribuidos, hacemos referencia a la capacidad del sistema para continuar en funcionamiento si alguno de sus componentes falla.

### Problema
Un sistema de microservicios que se comunica sincrónicamente puede estar expuesto a una cadena de fallas. Si un microservicio deja de responder, sus clientes también pueden tener problemas y dejar de responder a las solicitudes de sus clientes. El problema se propaga recursivamente a través del sistema, provocando fallos en cascada.

### Solución
Evitar enviar nuevas solicitudes a un servicio si detectamos un problema. Para comprobar el estado de los microservicios, utilizamos un Circuit Breaker que actúa de intermediario en la comunicación.

## Estados 
[](./img/estados-circuit-break.png)

### Comprobando el estado con Actuator
Resilience4j se integra con Actuator (una serie de servicios estándar que otorgan información sobre el estado del servicio) para exponer información sobre el estado del Circuit Breaker en tiempo real de varias maneras:

El estado actual del Circuit Breaker puede ser monitoreado usando el endpoint /actuator/health.
El Circuit Breaker además publica eventos en un endpoint de Actuator, por ejemplo, las transiciones de estados en /actuator/circuitbreakerevents.


## Resilience4J <a id='Resilience4J'></a>
Inicialmente, Spring Cloud nos ofrecía a Netflix Hystrix como Circuit Breaker. Sin embargo, actualmente, Spring Cloud implementa para esta tarea a una librería llamada Resilience4j. Esta es una librería de tolerancia a fallas de código abierto inspirada en Netflix Hystrix, pero diseñada para Java 8 y la programación funcional.

[](./img/Resilience4j_antes_y_ahora.png)

## Ejercicio asincrónico clase 14 
¡Vamos a practicar!
Nuestro chapter lead nos solicita implementar el patrón Circuit Breaker en la comunicación de dos microservicios que actualmente se registran en Eureka y se comunican utilizando Feign.

Dado los siguientes microservicios, utilizar Spring Cloud Circuit Breaker en conjunto con Resilience4j para implementar el patrón Circuit Breaker en la comunicación entre product-service y review-service.

 [eureka-server](https://drive.google.com/file/d/171WFB5lqJEA_PDXVymGPyPemHOLZo7z4/view)
 [review-service](https://drive.google.com/file/d/1zHKsDqLS9uJafFNqc2IAzbVVGlRcdWv0/view?usp=sharing)
 [product-service](https://drive.google.com/file/d/1Sp2bQp5DLbT7o9holJ1euvbBDsdXbiej/view?usp=sharing)

API Doc:

Review-service

[GET] /review/find

Request Params

productId (requerido)
faultPercent (probabilidad de que la API nos devuelva un error). (OPCIONAL)
El parámetro faultPercent es utilizado para provocar un error, con el objetivo de probar el Circuit Breaker. Es un campo opcional, por defecto la probabilidad de error es 0.

Ejemplos:

Request:
[GET]

http://localhost:8084/review/find?productId=1&faultPercent=0

faultPercent en 0 indica que tenemos 0% de probabilidades de que la API nos arroje un error.

Response:
```json
      

  [
    {
      "id": 1,
       "title": "Buen producto",
       "detail": "Buena relación/precio calidad",
       "productId": 1,
       "userId": 1
    },
    {
       "id": 2,
       "title": "¡Me encantó!",
       "detail": "Excelente calidad",
       "productId": 1,
       "userId": 2
   }
  ]
``` 

    
Request:
[GET]

http://localhost:8084/review/find?productId=1&faultPercent=99

faultPercent en 99 indica que tenemos 99% de probabilidades de que la API nos arroje un error.

Response:
```json
        

      {
        "timestamp": "2022-03-07T02:57:10.264+00:00",
        "status": 500,
        "error": "Internal Server Error",
        "path": "/review/find"
      }
```   
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






