/*
1
Empecemos por practicar la sintaxis de una arrow function que no recibe parámetros.
Para este ejercicio vamos a dar tres funciones ya definidas. Nuestro trabajo será 
cambiarle la sintaxis y volver a escribirlas para que sean funciones de tipo arrow.*/

function dameCinco() {
    return [1,2,3,4,5];
}

function multiplicarPorDos() {
  return 123 * 2 ;
}

function mostrarNombre() {
  return "Mi nombre es Hernán";
}

// Cambiadas:


let dameCinco= ()=>[1,2,3,4,5];


let multiplicarPorDos=   ()=> 123 * 2;

let mostrarNombre= ( ) =>"Mi nombre es Hernán";


/*2
Convertir a arrow 2 (con parametro)
Ahora nuestro trabajo será refactorizar la función saludar() que recibe un parámetro, es decir, 
escribirla con la sintaxis necesaria para convertirla en una arrow function
*/
function saludar(nombre) {
    return 'Hola, ' + nombre + '!';
}


// respuesta 
let saludar = nombre => 'Hola, ' + nombre + '!';

/* 3

Convertir a arrow 2 (con mas parametros)
¡Vamos a pasar nuestra función declarada a una arrow!

Y sí, solo nos falta practicar la sintaxis de una arrow function que reciba más de un parámetro.
Tomemos la función saludar(), que esta vez recibe un nombre y un apellido, 
y veamos de convertirla en una arrow function.*/

function saludar(nombre, apellido) {
    return 'Hola, ' + nombre + ' ' +  apellido + '!';
}

// respuesta
let saludar = (nombre, apellido) => 'Hola, ' + nombre + ' ' +  apellido + '!';