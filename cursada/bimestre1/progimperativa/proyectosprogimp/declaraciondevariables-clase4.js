//Ejercicios clase 4 

//Variables numéricas

/* 1. Declará una variable llamada uno y asignale un número cualquiera.
2. Declará una variable llamada dos y asignale como valor la variable uno.
3. Cambiá el valor de la variable uno.
Pensá antes de ver el resultado: ¿cuál es el valor de la variable dos?
Mensaje con variables */
let uno = 1;
let dos = 2;
uno = dos;

/*
4. Declará las siguientes variables y asignales un valor:
a. 'nombre'
b. 'edad'
c. 'cumpleaños'
d. 'ciudad'
e. 'ocupacion'
f. 'hobbie'*/

let nombre = "María";
let edad = 25;
let cumpleaños = "15 de oct";
let ciudad = "Buenos Aires";
let ocupacion = "estudiante";
let hobbie = "pintar";

//Usá console.log para escribir un párrafo que combine strings con la información guardada en las variables.

console.log(nombre + " tiene " + edad + " años de edad. Ella nació el " + cumpleaños + " en la ciudad de " + ciudad + ". " + nombre + " es " + ocupacion + " pero, su hobbie es " + hobbie);

//Desafío Bonus: creá múltiples variables en una única línea de código.

let nombre = Ana,
    edad = 14,
    cumpleaños = "12 de enero",
    ciudad = "Caracas",
    ocupacion = "estudiante",
    hobbie = "jugar fútbol";


//Calculadora de edad

/* 1. Crea distintas variables con edades de usuarios.
2. Calculá la cantidad de días que tienen esos años.
3. Mostrá la respuesta en la consola.
Suma de valores*/

let usuario1 = 34;
let usuario2 = 15;
let usuario3 = 28;
let años = usuario1 + usuario2 + usuario3
let calculadoradias = años / 365;

console.log(calculadoradias);


/*4. Creá tres variables: num1, num2, resultado.
5. Asignale un valor a num1 y num2.
6. Asignale a resultado el valor de la suma entre num1 y num2.
7. Mostrá por consola el valor de resultado.
 */


let num1;
let num2;
let resultado = num1 + num2
console.log(resultado);





//Calculador de abastecimiento de por vida
/* 
Ejercicio 1: 

¿Cuántos snacks vas a comer por el resto de tu vida? ¡Averigualo!
1. Almacená tu edad en una variable.
2. Guardá tu edad máxima en otra variable.
3. Declará una variable con el nombre de tu snack favorito.
4. Estimá cuántos snacks vas a comer por día y guardalo como un
número en una variable.
5. Calculá cuántos snacks te quedan por comer en el resto de tu vida.
6. Mostrá en la consola el resultado: "Vas a necesitar NN snacks para
que te alcancen hasta los XX años.".
7. Agregale un precio por unidad y descubrí cuánto vas a gastar en
snacks el resto de tu vida. */


let edad = 30;
let max = 120;
let snack = "papas fritas"
let snackxdia = 2;
let cuantoSnack = max - edad / 365
let resultadosnack = cuantoSnack * 2;

console.log("Vas a necesitar " + resultadosnack + " snacks para que te alcancen hasta los " + max + " años.");

let precio = 50;
let gastoDePorVida = resultadosnack * 50;
console.log("Vas a gastar en snacks " + gastoDePorVida + " pesos.");



/* 
Ejercicio 2:

Estás organizando tus vacaciones y tenés que calcular cuánto dinero vas a
necesitar para la comida.
1. Almacená la cantidad de días que vas a estar de viaje en una
variable.
2. Estimá tu presupuesto máximo por todo el viaje y guardalo en una
variable.
3. Declará la variable comida
4. Estima cuántas comidas vas a tener en todo tu viaje. Guardá este
valor en una variable.
5. Teniendo en cuenta tu presupuesto máximo, calculá cuánto podés
gastar en cada comida.
6. Mostrá la consola el resultado: "Podés gastar XX en cada comida
para que te alcance la plata durante los XX días de viaje". */

let diasDeViaje = 70;
let presupuestoMax = 5000;
let comida;
let comidasEnElViaje = diasDeViaje * 3;
let gastoEnComida = presupuestoMax / comidasEnElViaje;

console.log("Podés gastar " + gastoEnComida + " en cada comida para que te alcance la plata durante los " + diasDeViaje + " días de viaje");


// Calculador de IMC
/* Te proponemos calcular los índices de masa corporal de los clientes de un
nutricionista. El nutricionista envía la siguiente tabla:

Nombre Apellido Edad Peso Altura Prepaga
Nicolás López   27   83.5    170 Swiss Medical
Esteban Piazza  28   80.1    176 OSDE
José Fermoso    33   63.7   153 NO TIENE
Juana Fernández 26   55.0   162 Omint

¿Cuáles son las variables? ¿Cuáles son las constantes? ¿De qué tipo son? ¿Cuál
podría cargar el valor null según estos datos?
 */


/* El Índice de masa corporal (IMC) se calcula dividiendo el peso por altura al
cuadrado (la altura debe estar en metros y el peso en kilogramos). Por ejemplo,
en el caso de Esteban Piazza, la altura al cuadrado es 3,09. */

/* Deberás crear 6 variables:
1. Nombre
2. Edad
3. Peso
4. Altura
5. ¿Tiene prepaga? (solo nos interesa saber si tiene o no tiene, ¿qué tipo de
dato crees que sería el indicado?)
6. Índice de masa corporal (IMC, recordá cuáles son las buenas prácticas a la
hora de nombrar a nuestras variables)
El programa deberá presentar por pantalla los IMC de varios de los pacientes de
la tabla y tu propio IMC en una cadena de texto que diga, por ejemplo, “José
Formoso tiene 33 años y su índice de masa corporal es de xx”.    */

function calculadoraDeIMC(nombre, edad, peso, altura, prepaga) {

    const IMC = peso / (altura * 2)

    console.log("El cliente " + nombre + " de " + edad + " años de edad. Prepaga:" + prepaga + ". " + "Tiene un ICM de " + IMC);
}

calculadoraDeIMC("Nicolas", 27, 83.5, 1.7, true);