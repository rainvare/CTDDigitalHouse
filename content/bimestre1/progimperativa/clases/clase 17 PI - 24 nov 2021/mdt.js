// ARROW FUNCTION
// ACTIVIDAD 1
// Crear una función que convierta pulgadas en centímetros. Recibe por parámetro pulgadas y retorna su equivalente en centímetros.
let pulgadasEnCentimetros = a => a * 2.54;
console.log(pulgadasEnCentimetros(4));
// ACTIVIDAD 2
// Crear una función que recibe un string y lo convierte en una una URL. ej: “pepito” es devuelto como “http://www.pepito.com”
let stringAURL = palabra => 'http://www.'+ palabra + '.com';
console.log(stringAURL('camila'));
//ACTIVIDAD 3
// Crear una función que recibe un string y devuelve la misma frase, pero con admiración. 
let palabra = frase => "¡"+ frase + "!";
console.log(palabra('hola mundo'));

//ACTIVIDAD 4
// Crear una función que calcule la edad de los perros, considerando que 1 año para nosotros son 7 de ellos. 
let calcularEdadPerro = (edadPerro) => edadPerro * 7;
console.log(calcularEdadPerro(3));

//ACTIVIDAD 5
// Crear una función que calcule el valor de tu hora de trabajo, introduciendo tu sueldo mensual como parámetro. Considera que tu mes de trabajo tiene 40 horas.

let calcularValorHoraTrabajada = (sueldoMensual) => 'El valor de la hora trabajada es: '+ sueldoMensual / 40;
console.log(calcularValorHoraTrabajada(400000));

// ACTIVIDAD 6
// Crear la función calculadorIMC() que reciba la altura en metros y el peso en kilogramos y calcule el IMC de una persona. Luego, ejecutar la función probando diferentes valores
let calculadorIMC = (altura, peso) => peso / (altura * altura);
console.log(calculadorIMC(1.80, 70).toFixed(2));

// ACTIVIDAD 7
// Crear una función que recibe un string en minúscula, lo convierta a mayúsculas y lo retorne. Pista: investigá qué hace el método de strings: toUpperCase()
let mayusculas = (palabra) => palabra.toUpperCase(palabra);
console.log(mayusculas("palabra"));

// ACTIVIDAD 8
// Crear una función que recibe un parámetro y devuelve qué tipo de dato es ese parámetro. Pista: te servirá revisar qué hace la palabra reservada typeof. 
let tipoDato = (dato) => typeof dato;
console.log(tipoDato('hola'));

// ACTIVIDAD 9
// Crear una función a la que le pasamos el radio de un círculo y nos devuelve la circunferencia. Pista: investigá si el objeto Math tiene entre sus propiedades el número pi.

let calculaCircunferencia = (radio) => 2 * Math.PI * radio;
console.log(calculaCircunferencia(1));

// CALLBACKS
//Array de nombres
let mostrarResultado = nombre => nombre ? 'Nombre encontrado' : 'Nombre no encontrado';

const nombres = ['Martin','Homero','Cosme','Steven','Adam'];
let buscarNombre = (nombre, callback) => {
    let encontrado = '';
    for (let i = 0; i < nombre.length; i++) {
        if (nombres[i] == nombre) {
            encontrado = 'Nombre encontrado';
        }
    }
    return callback(encontrado);
}

console.log(buscarNombre('Martin', mostrarResultado)); 
console.log(buscarNombre('Marcos', mostrarResultado));