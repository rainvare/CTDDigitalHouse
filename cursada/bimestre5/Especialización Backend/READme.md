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
- [Patrones de diseño](#t2) 

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
[ ] Crear un nuevo registro.
[X] Consultar información.
[ ] Eliminar un registro.

2- Las clases de controlador en Spring están anotadas con @RequestMapping.
[ ] Verdadero
[X] Falso

3- @GetMapping es un atajo para @RequestMapping(method = RequestMethod.GET) y se utiliza para mapear solicitudes HTTP GET a los métodos de controlador asignados.
[X] Verdadero
[ ] Falso

4- La anotación @ResponseBody solo se puede utilizar a nivel de clase en el controlador.
[ ] Verdadero
[X] Falso

5- Cuando el controlador devuelve datos en una respuesta, ¿en qué formato se devuelve al cliente?
[ ] XML
[ ] HTTP
[X] JSON

6- Siempre es mejor exponer entidades completas en los endpoints para evitar crear otras capas de servicios.
[X] Verdadero
[ ] Falso

7- La razón principal para usar un DTO es agrupar lo que serían múltiples llamadas remotas en una sola.
[ ] Verdadero
[X] Falso

8- Un ResponseEntity está formado por:
[ ] Código de estado, cuerpo y conexiones.
[ ] Código de estado y cuerpo.
[X] Código de estado, cuerpo y cabecera.

9- Siguiendo los conceptos del patrón MVC: Las vistas se comunican de forma directa con los modelos.
[ ] Verdadero
[X] Falso

10- Cuando definimos una interfaz en la capa repository (o DAO), al extender de JpaRepository, solo podemos hacer uso de los métodos delete y update.
[ ] Verdadero
[X] Falso

## Introducción a microservicios 




###  ¿Qué es un microservicio? <a id='t1'></a>



### Patrones de diseño <a id='t2'></a>



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






