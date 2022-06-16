/* Ejercicios con strings*/

//1
/*Debemos crear una función llamada dominio que recibirá un string como "digitalhouse.com.ar" y su función será retornar: "http://www.digitalhouse.com.ar".*/
function dominio(string){
    return 'http://www.' + string;
}

//2
/*Lo primero que necesitamos es declarar una variable llamada texto, asignándole como valor un texto (string), el que queramos. Luego, utilizando la propiedad length, tendremos que imprimir en consola el total de caracteres que contiene la frase.*/
let texto=  'esternocleidomastoideo';
function longitud(texto){
    return texto.length;
}

console.log(longitud(texto));

//3
/*Nuestra misión, ahora, es crear una función llamada reemplazoFastFast que va a recibir los siguientes tres parámetros:

1. Un texto.

2. La palabra que vamos a buscar para reemplazar.

3. La palabra que vamos a usar para reemplazar.

La función deberá devolver el texto con la palabra reemplazada.

Ejemplo:

let textoSinGuiones = reemplazoFastFast('Este texto es mala onda','mala','buena');
console.log(textoSinGuiones) //'Este texto es buena onda'*/

let texto= 'Este texto es mala onda';
let palabra='mala';
let reemplazo='buena';

function reemplazoFastFast(texto, palabra, reemplazo){
return texto.replace(palabra,reemplazo) ;
}
console.log(reemplazoFastFast(texto, palabra, reemplazo));

//4
/*Para el siguiente ejercicio vamos a suponer que tenemos un texto que copiamos y queremos saber si el texto menciona una palabra en particular.
Para lograrlo, tendremos que crear una función llamada menciona, que recibirá dos parámetros: un texto —que es donde vamos a buscar— y una palabra —que es la que vamos a averiguar si se menciona en el texto—. La misma función retorna true en el caso de encontrar la palabra.


Ejemplo:

menciona('Existen muchos lenguajes de programación y JavaScript es uno de ellos','programación'); // true*/

let texto= 'Existen muchos lenguajes de programación y JavaScript es uno de ellos';
let palabra= 'programación';

function menciona(texto, palabra){
    if( texto.indexOf(palabra)== -1){
    return false;
    }
    else{
        return true
    }
}
console.log(menciona(texto, palabra))

//5
/*Teniendo como punto de partida la cadena de texto '¡Hola!, soy Carli', deberemos recortarla para poder obtener el nombre 'Carli' en una nueva variable llamada licenciada.

IMPORTANTE: Para la resolución tendremos que usar la función slice().*/

let frase = 'Hola!, soy Carli';
let string="Carli";
let licenciada= console.log(frase.slice(11));



/*/* Obtenemos un array de correos a los cuales deberemos realizar una serie de verificaciones para corroborar si son válidos. Para ello, por el momento, debemos buscar el carácter “@” en cada elemento y agregar aquellos que lo tengan al array de correos admitidos. En caso de no encontrar el carácter, se deberá agregar al array de correos descartados. */

/*
1. Desarrollar una función que realice la verificación de cada elemento del array de correos pendientes. En caso de validar, agregar al arrayCorreoAdmitidos, caso contrario agregar al arrayCorreoDescartados.
2. Mostrar por pantalla la cantidad y los elementos de cada array.
*/


let arrayCorreosPendientes = [ 
	'iroman@digitalhouse.com',
	'loki%digitalhouse.com',
	'loki@digitalhouse.com',
	'thanosdigitalhouse.com',
	'thanos@digitalhouse.com'
];

/* array de correos admitidos */
let arrayCorreosAdmitidos = [
  'thor@digitalhouse.com',
  'tucuMan@digitalhouse.com',
  'wanda@digitalhouse.com'
];

let arrayCorreosDescartados = [];

function verificarCorreo(correo){

 	if(correo.indexOf("@") != -1){
     arrayCorreosAdmitidos.push(correo);
   }
  else{
    arrayCorreosDescartados.push(correo);
  }//tu código   
}

verificarCorreo(arrayCorreosPendientes[0]);
verificarCorreo(arrayCorreosPendientes[1]);
verificarCorreo(arrayCorreosPendientes[2]);
verificarCorreo(arrayCorreosPendientes[3]);


console.log("--- Array de correos admitidos: " + "longitud de array" + " ---");
console.log(arrayCorreosAdmitidos);
console.log();
console.log("---Array de correos Descartados:"+  "longitud de array" + " ---");
console.log(arrayCorreosDescartados);