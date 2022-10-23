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
 
Mdt clase 2
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






