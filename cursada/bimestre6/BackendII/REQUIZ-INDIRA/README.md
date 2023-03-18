# Lasciate ogni speranza, voi ch'entrate
Parcial para la especialización de Backend II en la carrera CTD de DigitalHouse
-----

El trabajo parcial consistirá en entregar la resolución de las prácticas de clase que afectan al trabajo integrador del sistema de películas online
![Consigna](./Entrega_Parcial_-_Trabajo_Integrador_.docx%20(1).pdf)

-----------------


### Requerimientos 
Cualquier sistema operativo con soporte para Java 8
Mínimo 512M de RAM
Por lo menos 1G de espacio en disco
Docker

### Inicialización del proyecto

Abrir el terminal en la carpeta raíz,
ejecutar el docker-compose up para la instalación del keycloak y el levantamiento de los contenedores.

#### Reino creado 
Digitalmedia

#### Login
Se creo un usuario por grupo:
user: contraseña user
admin: contraseña admin
provider: contraseña provider

También se integró el acceso a través de Github

(La configuración del reino DigitalMedia también está disponible en formato json para su importación directa desde la interfaz de keycloak)

### Orden de inicialización de los Microservicios

- Eureka-service
- Api-gateway
- Ms-movies
- Ms-bills
- Users-service

Se integró a estos microservicios las dependencias, y las modificaciones de seguridad que provee keycloak, en su configuración.
También se implementó Feign en el miscroservicio de Bills, para su conexión con users.

---------------------

#### Pendientes

El proyecto no está dockerizado, presenta problemas de conexión y redireccionamiento.

------------

Se supone que en algún momento entenderé que hice acá, y si eso no pasa, solo tengo que agradecer los tutoriales de Stian Thorgersen..




