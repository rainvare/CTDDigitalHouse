---

<t>Infraestructura II</t>

---
## Índice

1. Módulo 1 - Inmersión
- [C1 ](#c1) Infraestructura como código
- [C1a](#c1a) DevOps
2. Módulo 2 - Infraestructura como código
3. Módulo 3 - Pipelines
4. Módulo 4 - Monitoreo
5. Módulo 5 - Cierre 

    - # Ejes de la materia
## Infraestructura como código <a id='c1'></a>

Es la gestión de la infraestructura en un modelo descriptivo, utilizando las mismas herramientas de versionado que un equipo utiliza para su código fuente. De manera análoga a cómo el mismo código fuente genera el binario, un modelo de infraestructura como código debe generar el mismo entorno cada vez que se aplica.

La infraestructura como código en conjunto con los pipelines de despliegue continuo nos permiten automatizar los deploys de infraestructura, logrando que sean más rápidos y menos propensos a errores.

## Pipelines de CI/CD

La **integración continua** (CI) es una práctica de desarrollo que consiste en integrar el código a un repositorio compartido de manera frecuente. Cada integración es verificada por un proceso automatizado, permtiendo a los equipos detectar problemas rápidamente.

El **despliegue continuo** (CD) es la capacidad de poner en un ambiente productivo cualquier tipo de cambio (nuevas funcionalidades, soluciones de bugs, experimentos, etc) de manera segura y sostenible. Esto se logra al asegurarnos que el código se encuentra en un estaod desplegable incluso al hacer cambios constantes.

Ambas prácticas se llevan a cabo mediante **pipelines de CI o CD** que son procesos automatizados por los que pasa el código (fuente o binario) hasta llegar a su destino final (ya sea productivo o de testing).

## Monitoreo

- **Monitoreo de aplicaciones** → es el proceso de medir la performance, disponibilidad y experiencia de usuario de una aplicación. Estas métricas se utilizan para identificar y resolver problemas en la aplicación antes de que impacten en los usuarios.
- **Monitoreo de servidores** → es el proceso de ganar visibilidad respecto a la actividad de nuestros servidores (físicos o virtuales). Se puede enfocar en distintas métricas de los servidores, pero las principales son la disponibilidad y la carga.

# Conexión con otras materias

[conexión](https://view.genial.ly/60fb526757ce830d9ce57554)

# DevOps <a id='c1a'></a> 

Antes al desarrollar un producto cada departamento estaba aislado y separado uno de los otros, lo que implicaba que estuvieran incomunicados y pasandose el código a ciegas:

![](./img/Untitled.png)

![](./img/Untitled%201.png)

DevOps es la combinación de filosofías, prácticas y herramientas que incrementan la velocidad a la que una organización entrega aplicaciones y servicios, permitiendo mejorar los productos a un ritmo más rápido que las organizaciones que usen procesos de desarrollo e infraestructura tradicionales. Esta velocidad le permite a las organizaciones entregar más valor a sus clientes y ser más competitivas en el mercado.

![](./img/Untitled%202.png)

![](./img/Untitled%203.png)

![](./img/Untitled%204.png)

## Herramientas

- Control de versiones → llevar un registro y gestionar los cambios realizados en el código fuente
    
   ![](./img/Untitled%205.png)
    
- Contenedores → es una unidad estándar que empaqueta el código y sus dependencias para que la aplicación pueda funcionar de forma confiable en diversos entornos
    
    ![](./img/Untitled%206.png)
    
- Orquestadores → se ocupa del despliegue, gestión, escalamiento, conectividad y disponibilidad de las aplicaciones basadas en contenedores
- Monitoreo de aplicación → es el proceso de medir la performance, la disponibilidad y experiencia de usuario de una aplicación. Nos permite resolver problemas antes de que impacte en nuestros usuarios
    
    ![](./img/Untitled%207.png)
    
- Monitoreo de servidores → es el proceso de ganar visibilidad respecto a la actividad de los servidores (físicos o virtuales). Las principales métricas son disponibilidad y carga.
    
    ![](./img/Untitled%208.png)
    
- Gestión de configuración → es un proceso que lleva un registro de las distintas configuraciones que un sistema adopta a lo largo de su ciclo de vida
    
    ![](./img/Untitled%209.png)
    
- Integración continua → es una práctica de desarrollo que consiste en integrar el código a un repositorio compartido lo más frecuentemente posible, idealmente varias veces al día. Cada integración es verificada por un proceso automatizado.
    
    ![](./img/Untitled%2010.png)
    
- Despliegue continuo → es la habilidad de poner en producción cambios de cualquier tipo de manera segura y sostenida. Dichos cambios pueden ser nuevas funcionalidades, cambios de configuación, solución de errores, experimentos, etc.
- Automatización de pruebas → es un software que hace uso de herramientas de automatización para controlar la ejecución de las pruebas. Luego esos resultados se comparan con los esperados para determinar si tuvieron o no éxito.
    
    ![](./img/Untitled%2011.png)
    
- Infraestructura como código → es la gestión de infraestructura con un modelo descriptivo, usando las mismas herramientas de versionado que los desarrolladores.
    
    ![](./img/Untitled%2012.png)
    
- Computación en la nube → es el uso de servicios de cómputos a través de internet.
    
    ![](./img/Untitled%2013.png)
    

Perfiles

![](./img/Untitled%2014.png)

- Desarrolladores → Son quienes desarrollan la aplicación, los programadores front-end, back-end, mobile, full stack o especializados en una tecnología particular. En un entorno DevOps es importante que se comuniquen constantemente con los demás roles.
- QA → Son quienes verifican y validan la aplicación. En un entorno DevOps es importante que también se concentren en automatizar pruebas para hacerlas repetibles y confiables.
- Analistas de infraestructura → Son quienes implementan la infraestructura sobre la cual se ejecutarán las aplicaciones y las bases de datos. También se ocupan del mantenimiento y la evolución de esta infraestructura. Buena parte de las prácticas de DevOps recaen sobre ellos, en especial la comunicación con quienes desarrollan la aplicación.
- Analistas de redes → Se ocupan de la interconexión entre distintos sistemas, es decir, de las redes de computadoras (físicas o virtuales). Es poco frecuente que se necesite una persona dedicada de forma exclusiva a las redes, es más común que este rol sea ocupado por el analista de infraestructura.
- Analistas de seguridad → Son personas que trabajan en la seguridad de la aplicación y de la infraestructura. A veces no se dispone de un empleado por equipo dedicado de forma exclusiva a este rol. En esos casos es importante que todo el equipo reciba entrenamiento en seguridad.
- Analistas de CI/CD → Son quienes mantienen los pipelines de integración y despliegue continuos. En aplicaciones simples es común que esta persona sea la misma que ocupa el rol de analista de infraestructura, pero en aplicaciones más complejas es necesario diferenciar roles.
- Arquitectos de nube → Definen la arquitectura del entorno en la nube: la estructura que tendrán los servidores, cómo se interconectan y varios aspectos de seguridad relacionados. También definen quiénes tendrán acceso a los distintos entornos. En organizaciones pequeñas no hay una persona dedicada de forma exclusiva a esto y la función recae sobre el analista de infraestructura.
- SRE → Son los encargados de diseñar y monitorear el sistema para minimizar las suspensiones de servicio y el tiempo de recuperación de los servicios. Trabaja tanto de forma proactiva como reactiva, respondiendo a incidentes, pero también intentando que no ocurran o vuelvan a ocurrir.
- Gerentes de entregas → En algunos casos no es posible realizar despliegue continuo, por limitaciones del mercado o por la naturaleza del producto —por ejemplo, cada despliegue significa inevitablemente una suspensión temporal del servicio o cada cliente requiere una versión distinta del producto—. En estos casos, el gerente de entregas se ocupa de coordinar la entrega de nuevas versiones del producto a los clientes, llevar registro de qué cliente tiene qué versión del producto y orientar los esfuerzos del equipo hacia la satisfacción de los clientes.


<!-- []() <a id='c1a'></a> -->