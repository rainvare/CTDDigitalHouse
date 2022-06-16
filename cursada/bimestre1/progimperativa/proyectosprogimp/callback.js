/* 1
Pasar un callback
Vamos a crear tres funciones y ver cómo empezar a trabajar con callbacks.

La primera función se llamará doble. Esta recibirá un número y retornará el doble.

La segunda función se llamará triple. Esta recibirá un número y retornará el triple.

La tercera función se llamará aplicarCallback y recibirá por parámetro un numero y una función. Esta retornará el valor de aplicar dicha función al valor que recibió.

Ejemplo:

aplicarCallBack(2, doble); // 4
aplicarCallBack(4, triple); // 12
*/
let doble = numero => numero * 2;
let triple = numero => numero*3;

let aplicarCallback = (numero, operacion) => operacion(numero);

console.log(aplicarCallback(4, triple)); 


/* 2

Callback calculadora
Vamos a ver cómo podemos crear una función que nos sirva como calculadora. Empecemos con algo sencillo...

Creemos cuatro funciones que realicen las operaciones principales de una calculadora. Nuestro trabajo será definir la función suma, resta, multiplicacion y division. Cada una de ellas recibirá dos parámetros y deberá realizar la operación matemática según corresponda. Por ejemplo, la función suma deberá retornar la suma de ambos parámetros; la función resta, la resta de ambos parámetros, y así sucesivamente.
Ahora sí, con esas funciones ya definidas, creemos la función calculadora. Esta función recibirá dos parámetros numéricos y una función, que será nuestro callback.
*/

let suma = (a , b) => a + b;
let resta = (a , b) => a - b;
let multiplicacion = (a , b) => a * b;
let division = (a , b) => a / b;
let calculadora = (a , b , operacion) => operacion(a , b);

console.log(calculadora(5 , 3 , suma));
console.log(calculadora(5 , 3 , resta));
console.log(calculadora(5 , 3 , multiplicacion));
console.log(calculadora(5 , 3 , division));

/* 3
Pasar un calback v2
Vamos a ejecutar una función que recibimos por parámetro a cada uno de los elementos de un array. 

Para esto debemos completar la función procesar. Esta recibe dos parámetros:

1. El primer parámetro es un array.

2. El segundo parámetro que recibe es una función (al que solemos llamar callback).

La función deberá retornar un array donde cada elemento es el resultado de aplicar la función pasada a un elemento del array pasado.

Dejamos unas funciones para comprender y probar con el ejemplo:


  let urlCompletas = procesar(["www.google.com","www.yahoo.com"],agregarHttp)
  console.log(urlCompletas); // imprime [ 'http://www.google.com', 'http://www.yahoo.com' ]
  let largoDeElmentos = procesar(["www.google.com","www.yahoo.com"],largoString)
  console.log(largoDeElmentos); // imprime [ 14, 13 ]*/


  
let largoString = url => url.length;

function agregarHttp(url) {
    return 'http://' + url;
}

function procesar(url,operacion){
    resultado = [];
    for (let i = 0; i < url.length; i++) {
        resultado.push(operacion(url[i]));
    }
    return resultado;
}
let urlCompletas = procesar(["www.google.com","www.yahoo.com"],agregarHttp)
console.log(urlCompletas); // imprime [ 'http://www.google.com', 'http://www.yahoo.com' ]
let largoDeElmentos = procesar(["www.google.com","www.yahoo.com"],largoString)
console.log(largoDeElmentos); // imprime [ 14, 13 ]
