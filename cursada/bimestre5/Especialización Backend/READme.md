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






