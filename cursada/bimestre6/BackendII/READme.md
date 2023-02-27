<t>Backend II<t>

**¿Cuál es nuestro objetivo?**
En este curso, vamos a conocer cómo las grandes compañías abordan este tema y cómo resuelven la problemática de la seguridad de una manera más eficiente y menos costosa, delegando este problema a componentes externos que se encargarán de proteger nuestros microservicios, pero también aplicaciones como las SPA o móviles.

**¿Qué vamos a lograr?**

**Objetivos:**

- Adquirir los conocimientos teóricos y prácticos de los marcos de autenticación y autorización más seguros de la industria.

- Diseñar e implementar una arquitectura de seguridad de microservicios a través de un Identity and Access Management.

- Integrar la herramienta de Identity and Access Management en una solución basada en Spring Cloud.


**¿Dónde estamos?**

![Temario de la materia](./img/esp-modulos.png)
[presentación genialy](https://view.genial.ly/631a50616dbedd0010f4350a)

[Programa](./INTERNO%20Programa%20de%20Especializaci%C3%B3n%20Back%20End%20II%20-%20Seguridad%20en%20Microservicios-%20V2.html)

----------------------

## Índice

1. Módulo 1 -  

- [IAM](#m1) 

- [Keycloak](#c1)
 - [Características](#c1a)
 - [Instalación](#c1b)
 - [Panel de administración](#c1c)
 - [Creación de reinos](#c1d)
 - [Configuraciones](#c1e)

- [Estándares y autenticación](#c2)
- [Patrones de seguridad](#c2a)
 - [OAuth 2.0](#c2b)
 - [OpenID Connect (OIDC)](#c2c)
 - [Json Web Token (JWT)](#c2d)
 - [OIDC Discovery](#c2e)
 - [Autenticación de un usuario](#c2f)
    - [Recrear flujo de autenticación de OpenID Connect](#c2fa)
    - [Análisis de un ID token](#c2e)
 - [ ](#c2e)


- [Autenticación avanzada](#c3)
- [ ](#c3a)
 - [ ](#c3b)
 - [ ](#c3c)
 - [ ](#c3d)
 - [ ](#c3e)

- [Tokens y sesiones](#c5)
- [ ](#c5a)
 - [ ](#c5b)
 - [ ](#c5c)
 - [ ](#c5d)
 - [ ](#c5e)

- mdts

2. Módulo 2 -  

- [Repaso](#m2) 
 - [ ](c1a)
 - [ ](c1b)
 - [ ](#c1c)
 - [ ](#c1d)
- mdts

3. Módulo 3 -  

- [Repaso](#m3) 
 - [ ](c1a)
 - [ ](c1b)
 - [ ](#c1c)
 - [ ](#c1d)
- mdts

4. Módulo 4 -  

- [Repaso](#m4) 
 - [ ](c1a)
 - [ ](c1b)
 - [ ](#c1c)
 - [ ](#c1d)
- mdts


-----------------------------
## Trabajo integrador
Consigna: Usar un middleware de IAM, que centralice la gestión y lógica de seguridad de usuarios para extraer esta responsabilidad de las API. Adicionalmente, plantean la necesidad de centralizar las llamadas a todas las API actuales y futuras API, mediante un proxy intermediario, es decir, mediante un API Gateway.

![](./img/trab-integr.png)

[PDF](./Trabajo%20Integrador%20-%20Contexto%20.html)



---------------------------------
<!--###############################################--  MÓDULO 1--#####################################################################-->
##  Identity and Access Management
 <a id='m1'></a>

Identity and Access Management (administración de identidad y acceso o IAM) es todo lo que sucede detrás de un login. La administración de identidad y acceso permite que las personas puedan acceder (validando su identidad) a los recursos que les corresponden según sea su rol.

Entonces, un Identity and Access Management es un sistema que permite a las personas verificadas acceder a los recursos permitidos en el momento que sea solicitado. IAM viene a resolver la necesidad de garantizar el acceso adecuado a los recursos en entornos tecnológicos cada vez más heterogéneos, cumpliendo con rigurosos requisitos.


![](./img/iam-funcion.png)

[presentación genialy](https://view.genial.ly/6262fdfe093fbb0018e01897)


Los sistemas IAM, como base, proporcionan:

- Gestión de los usuarios: el sistema puede gestionar un repositorio propio de usuarios para crear, modificar y eliminarlos, o puede integrarse con otros repositorios y sincronizarse con ellos. Los usuarios también pueden representar a entidades no humanas, como software, dispositivos IoT o robótica.

- Roles: IAM permite agrupar usuarios según un rol para luego determinar su nivel de acceso. Por ejemplo, administradores, editores, etc.
Autenticación: IAM autentica a un usuario al confirmar que es quien dice ser. Generalmente, se utiliza la autenticación multifactor. Esta consiste en proveer más credenciales generadas de manera distinta a fin de fortalecer la autenticación.

- Autorización: la gestión de accesos garantiza que a un usuario se le otorga el nivel exacto y el tipo de acceso al que tiene derecho.
Reportes: podemos generar reportes sobre las acciones realizadas en la plataforma, como la hora de inicio de sesión, los sistemas a los que se accede y el tipo de autenticación.

- Single sign-on (SSO): permite a los usuarios autenticarse utilizando las credenciales “federadas” en un único portal (por ejemplo: Google o Facebook). De esta manera, no es necesario que el usuario se registre nuevamente con un usuario y contraseña.

- Autenticación de múltiples factores (MFA): en una era en la que las contraseñas a menudo son robadas, el requisito de una prueba de identidad adicional es el nuevo estándar. La autenticación a través de huellas dactilares y las contraseñas de un solo uso son ejemplos de métodos de autenticación comunes.

### Keycloak <a id='c1'></a>

Keycloak es una herramienta de gestión de identidad y acceso de código abierto que se centra en aplicaciones modernas, como SPA (single page application), aplicaciones móviles o API REST. Se utiliza en producción para escenarios que van desde pequeños sitios web con solo un puñado de usuarios hasta grandes empresas con millones de usuarios.

#### Características de Keycloak: <a id='c1a'></a>
- páginas de inicio de sesión totalmente personalizables
- puedes delegar los mecanismos de autenticación
- Permite a los usuarios acceder a múltiples aplicaciones autenticándose una única vez
- Tiene su propia base de datos de usuarios
- Es altamente escalable y proporciona alta disponibilidad. 

![](./img/keycloak.png)

[presentación genialy](https://view.genial.ly/631f5a89afcd430018b725b2)


[Clientes en Keycloak](./clase%201%20-%2013%20de%20feb%20de%202023/6.%20Clientes%20de%20reinos%20de%20keycloak.pdf)

### Instalación y ejecución de Keycloak <a id='c1b'></a>
Keycloak proporciona varias opciones de instalación. Algunas de ellas son:

Ejecutándolo como un contenedor de Docker.
Instalándolo y ejecutándolo localmente utilizando Java.
Ejecutándolo con Kubernetes.
Nosotros vamos a utilizar Docker para ejecutarlo, ya que consideramos que es la opción más simple.



#### Ejecutando Keycloak con Docker

1- Levantar docker 
2- Ejecutar el código siguiente:
<code docker>
docker run -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:18.0.0 start-dev
</code docker>    


El comando de arriba nos permite ejecutar keycloak en un contenedor, en donde además indicamos que queremos exponer el puerto 8080, y configuramos las credenciales para el usuario administrador.

Listo, ahora podemos acceder a http://localhost:8080 para verificar su ejecución.

### Panel de administración <a id='c1c'></a>
![panel de administración](./img/keycloak-img.png)


### Creación de reinos en Keycloak <a id='c1d'></a>
Son las entidades que pueden solicitar a Keycloak  la autenticación de un usuario. Generalmente, son aplicaciones y/o servicios que necesitan  autenticar vía single sign-on.
También pueden ser entidades que requieren información del usuario autenticado previamente o un token relacionado con ellos para poder 
invocar a otros servicios de la solución que también usen KeyCloak.

[Crear un reino en Keycloak](./clase%201%20-%2013%20de%20feb%20de%202023/2.%20%C2%BFC%C3%B3mo%20creamos%20un%20reino_.pdf)


### Configuraciones de Keycloak <a id='c1e'></a>

Al trabajar de forma local con Keycloak puede ocurrir que necesitemos guardar la configuración de nuestro reino para poder utilizarla en otra computadora o, también, en el caso de que nuestra configuración se pierda y debamos realizarla desde cero. Keycloak nos permite importar y exportar nuestras configuraciones en archivos JSON.


[PASO A PASO - Exportar e importar configuracione de reinos en Keycloak](./clase%201%20-%2013%20de%20feb%20de%202023/2.%20Pasos%20para%20exportar_%20importar%20configuraciones%20en%20Keycloak.pdf)

----------------------

### Estándares y autenticación <a id='c2'></a>
#### Seguridad:
Los protocolos de autenticación estandarizados han sido examinados públicamente por expertos y son de confianza. Debido a esto, muchas organizaciones confiarán en determinadas soluciones solo si se utilizan protocolos estandarizados como OAuth, OIDC o SAML. Cuando utilizamos un protocolo estandarizado, tenemos la tranquilidad de saber que nuestro sistema de autenticación sigue los pasos de los expertos de la industria y las mejores prácticas.

#### Aprendizaje transferible
¿Qué pasaría si cada vez que construimos el sistema de autenticación de un nuevo sistema, tenemos que crearlo desde cero? Tendríamos que aprender los detalles esenciales de la autenticación una y otra vez. Esto conduciría a un escenario en el que no podríamos aprovechar el conocimiento ganado con tanto esfuerzo entre proyectos y empleadores. Si, en cambio, utilizamos un protocolo ubicuo (como OAuth) puede haber diferencias sutiles, pero comprenderemos la arquitectura de autenticación general. Si sabemos cómo funcionan los protocolos estandarizados y qué casos de uso resuelven, podemos llevar ese conocimiento a otros proyectos y empresas. Lo mismo se aplica al enseñar e incorporar nuevos desarrolladores al equipo. Si utilizamos un protocolo de autenticación estandarizado, es probable que los nuevos miembros del equipo ya los conozcan. Por lo que será mucho más fácil hacer que estos nuevos miembros del equipo se pongan en marcha y contribuyan a estas áreas relevantes del sistema.

#### Soporte de librerías
La mayoría de los lenguajes de programación modernos tienen bibliotecas de códigos que se integran con los protocolos de autenticación estándar, lo que acelera nuestro trabajo de desarrollo. Mediante el uso de un protocolo de autenticación estandarizado, nuestros clientes y consumidores de API pueden reutilizar bibliotecas de códigos comunes para el lenguaje de programación elegido.


#### Interoperabilidad entre sistemas
El uso de un protocolo de autenticación como OAuth hace que nuestro sistema sea más interoperable con otros, es decir, se comunique de manera más sencilla con otros sistemas. Si trabajamos con una organización empresarial más grande, nuestro sistema necesitará integrarse con otros sistemas todo el tiempo. El uso de una forma estandarizada ahorra tiempo, sobrecarga mental y costos generales. Lo mismo se aplica a los sistemas externos. Si hemos creado una API compatible con OAuth, por ejemplo, nuestros clientes comprenderán cómo integrar sus soluciones y sistemas con los nuestros mucho más rápido y con muchos menos dolores de cabeza.

#### Manejo de casos límite
Los estándares han sido utilizados por muchas organizaciones y sistemas de muchas maneras diferentes. A menudo, los casos límite se manejan o se descartan explícitamente. Al aprovechar un estándar, obtendremos los beneficios de todo ese conocimiento y experiencia.

![](./img/estandares.png)

[Presentación genially](https://view.genial.ly/63208ba3a8e4f10018934e35)

### Patrones de seguridad  <a id='c2a'></a>
Los patrones de seguridad son soluciones reutilizables a los problemas de seguridad, que pueden adaptarse según sea necesario. En esta clase, aprenderemos sobre algunos patrones como:

- OAuth 2.0
- Open ID Connect (OIDC)
- Jason Web Token (JWT)
- OIDC Discovery

### OAuth 2.0 <a id='c2b'></a>
Cuando necesitamos darle acceso a la información de nuestra cuenta de Google (o a cualquier servicio) a un sitio web o aplicación, OAuth puede ayudarnos a garantizar ese acceso de forma segura. OAuth es, probablemente, el protocolo de autenticación más popular de la industria. ¿De autenticación? Bueno, de hecho, no es un protocolo de autenticación en sí mismo, como estamos a punto de ver.

Específicamente, OAuth permite que una aplicación obtenga de forma segura un token de acceso (un poco más adelante vamos a adentrarnos en el mundo de los tokens), que puede ser usado para realizar solicitudes adicionales a API de terceros o servicios web.

Podríamos decir, básicamente, que OAuth es un estándar que define la coreografía entre clientes y servicios para garantizar la forma en que se obtiene un token para acceder a los diferentes recursos de la aplicación o sitio web.

Por supuesto, en esta coreografía hay actores que tendrán diferentes roles y jugarán papeles muy importantes en el transcurso del proceso o flujo de solicitudes y recuperación de la información.

![](./img/oauth-clase-intro.jpg)

#### Funcionamiento de OAuth 2.0
![](./img/diagrama-claseoauth-intro.png)

En esencia, en el flujo de protocolo OAuth, el cliente (la aplicación) solicita al servidor de autorización (el servicio) el acceso a un recurso en nombre del propietario (el usuario). El servidor de autorización emite un acceso limitado al recurso en forma de token de acceso. Tras recibir el token de acceso, el cliente puede acceder al recurso en el servidor de recursos (aquí aparece Keycloak, gestionando el proceso), incluyendo el token de acceso en la solicitud.

Ya tenemos, entonces, una comprensión un tanto básica de cómo funciona tras bambalinas el estándar de OAuth… ¿Pero no necesitamos introducirnos más a fondo hasta desenterrar todo el complicado proceso y código que esto conlleva? Bueno, no necesariamente. Lo que siempre vamos a priorizar es usar una biblioteca que oculte su complejidad y nos ayude a aplicarlo de la manera correcta… y, por supuesto, nos ahorre trabajo.

Pero después de repasar el funcionamiento, habrás notado algo raro… OAuth se dedica a conceder acceso a los recursos (para continuar usando la terminología correcta: “autorizar”), pero no hace nada respecto a la “autenticación” de los usuarios. Para cubrir este aspecto aparece OpenID Connect (OIDC)


### OpenID Connect (OIDC) <a id='c2c'></a>

Decíamos que OpenID Connect es una extensión de OAuth, es decir, una capa simple de identidad (es también un protocolo estándar como OAuth) que se coloca por encima y hace que la tarea de verificar la identidad de un usuario (autenticarlo) sea más sencilla. Además, obtiene información básica del perfil desde el proveedor de identidad y permite que aplicaciones de terceros puedan verificar dicha identidad del usuario final.

Digamos que, una de las características más importantes (y parte de su propósito) es proponer un solo login para múltiples sitios o aplicaciones cada vez que vayamos a loguearnos en un sitio web que use OIDC, seremos redirigidos a un sitio de OpenID donde nos loguearemos y, posteriormente, seremos llevados de vuelta al sitio web principal.

<comments>
Por ejemplo, si ingresamos a un sitio y decidimos hacer login usando una cuenta de Google, entonces habremos usado OIDC. Una vez que somos autenticados exitosamente y autorizamos al sitio web o aplicación a la que estabamos tratando de ingresar para que pueda acceder a nuestra información, Google envía información al sitio web/aplicación sobre el usuario y sobre la autenticación realizada.

Esta información vuelve bajo la forma de un JWT (recibiremos un token de acceso -access token- y, probablemente, un token de identificación -ID token). Ya conocemos algo de JWT, pero vamos a ver qué papel juega exactamente en este proceso de autenticación/autorización.
</comments>


![](./img/open-id-connect.png)

### Json Web Token (JWT) <a id='c2d'></a>

Los JSON web tokens (JWT) son una forma estandarizada, compacta y autocontenida de transmitir de manera segura información entre partes. Sabemos que la J refiere a JSON y es que esa información se transmite como objetos de tipo JSON. Los JWT pueden ser verificados y confiados, ya que son firmados digitalmente (junto con la posibilidad de ser encriptados) y contienen toda la información requerida sobre una entidad, evitando tener que hacer consultas a una base de datos más de una vez. Además, quien recibe ese JWT tampoco necesita llamar a un servidor para validarlo. Pero vale la pena recalcar que, como dijimos que son un estándar, esto significa que todos los JWT son tokens, pero no todos los token son JWT.



#### Beneficios de JWT
 - Más compacto: 
 Los objetos de tipo JSON son menos verbosos que otros objetos (como XML). Por eso, cuando se codifican, son más pequeños que otros tokens, siendo posible enviarlos por una URL, un parámetro de una llamada POST o dentro de un header HTTP, con un poder de transmisión verdaderamente rápido
 - Más seguro:
 JWT puede usar pares de claves públicas o privadas bajo la forma de certificados de firma. Esto le otorga el poder de ser firmados de forma simétrica y compartidos entre partes que conocen un “secreto” usando algoritmos (por ejemplo, HMAC). Otros tokens, como los de SAML, también pueden usar pares de claves públicas/privadas, pero el proceso para firmar usando XML es mucho más complicado y no tan seguro como el proceso de firma de un JWT.
 - Más fácil de procesar:
 JWT se usa a escala de la Internet, esto significa que es más fácil de procesar en dispositivos, especialmente en los dispositivos móviles
 - autenticación:
 Cuando un usuario se registra exitosamente usando sus credenciales, se devuelve un token de identificación (ID token)
 - autorización:
 Una vez que el usuario fue autenticado, la aplicación puede solicitar acceso a diferentes recursos, servicios o rutas en nombre del usuario. Para tal fin, en cada solicitud (o request) se debe pasar un token de acceso (access token), el cual muy probablemente vaya en la forma de un JWT. Single sign-on (SSO) usa prácticamente siempre un JWT por los motivos que ya vimos (tamaño y facilidad de comunicación).
 - Intercambio de información:
 Los JWT son una manera segura de transmitir información entre partes debido a su capacidad de ser “firmados”, lo que significa que podemos estar seguros de que el remitente es quien dice ser y la información es fidedigna (y no fue manipulada en medio del proceso de comunicación)
 - seguridad:
 Por último, merece la pena repetir que los JWT son objetos verificables gracias a su firma y muy seguros, ya que además pueden ser encriptados, aumentando su capacidad de ser secretos. Estos son dos procesos posibles para asegurar la seguridad de los JWT: pueden ser firmados usando un secreto (usando un algoritmo, como HMAC) o un par de claves públicas/secretas con RSA o ECDSA (¡otros algoritmos sobre los que pueden investigar si tienen curiosidad!).
 
Entonces, es muy importante que, antes de usar un JWT, este sea validado de forma apropiada usando su firma. Podemos notar que un token validado con éxito asegura que la información no fue manipulada, pero no significa que no haya sido vista; por ello es muy importante nunca transmitir información sensible vía JWT y utilizar mecanismos para que no sea interceptado (por ejemplo, enviarlos por medio de HTTPS).

### OIDC Discovery <a id='c2e'></a>

Ya vimos los conceptos principales de OAuth 2.0 y OpenID Connect, ahora vamos a profundizar en el funcionamiento de OpenID Connect en conjunto con Keycloak. Para entender cómo funciona el flujo de autenticación, vamos a utilizar solamente Postman. En un caso real, Spring Security será el encargado de implementar el estándar OpenID de acuerdo a sus especificaciones, pero de esa forma no podríamos entender qué es lo que sucede por detrás.

OpenID es una especificación, o sea, podemos verla como una serie de reglas a seguir para garantizar la seguridad en nuestras aplicaciones. Una de esas reglas es OpenID Connect Discovery. Avancemos para conocer más sobre ella.

[OpenID Connect Discovery](./clase%202%20-%2015%20de%20feb%20de%202023/4.%20OpenID%20Connect%20Discovery.pdf)

#### Autenticación de un usuario <a id='c2f'></a>
![](./img/UTENTICACIONOPENID.png)

[Presentación genially](https://view.genial.ly/6269ead65b9e510018039fd0)

<a id='c2fa'>[Recrear flujo de autenticación de OpenID Connect](./clase%202%20-%2015%20de%20feb%20de%202023/4.%20Recrear%20flujo%20de%20autenticaci%C3%B3n%20de%20%20OpenID%20Connect%20.html) </a>

### Análisis de un ID token

En la consulta anterior obtuvimos —en la respuesta— un campo llamado id_token, cuyo valor es un JWT que contiene la información del usuario autenticado. Si copiamos el id_token y lo pegamos en https://jwt.io/ para decodificarlo y ver su información, nos muestra algo como lo siguiente:

- exp: Fecha de expiración del token
- iat : Fecha de creación del token.
- auth_time: Fecha de la última autenticación del usuario.
- jti: ID del token.
- aud: ID del cliente.
- sub: ID del usuario. Es recomendado utilizar este ID en las bases de datos en lugar de username o email, ya que estos pueden cambiar.

![](./img/tokenid%20partes.png)

[Presentación genially](https://view.genial.ly/634ea644e1cd4e0012cc39c7)

<coments>
Las fechas en los JWT están representadas en segundos desde el 1 de enero de 1970. Si queremos averiguar la fecha de algún campo, podemos utilizar la página www.epochconverter.com.
</coments>