/* Funciones simples
1. Crear una función que convierta pulgadas en centímetros. Es decir, recibe por
parámetro pulgadas y retorna su equivalente en centímetros.
2. Crear una función que recibe un string y lo convierte en una URL.
Ejemplo: “pepito” es devuelto como “http://www.pepito.com”.
3. Crear una función que recibe un string y devuelve la misma frase, pero con
admiración.
4. Crear una función que calcule la edad de los perros, considerando que 1 año
para nosotros son 7 de ellos.
5. Crear una función que calcule el valor de tu hora de trabajo, introduciendo tu
sueldo mensual como parámetro. Considera que tu mes de trabajo tiene 40
horas.
6. Crear la función calculadorIMC() que reciba la altura en metros y el peso en
kilogramos y calcule el IMC de una persona. Luego, ejecutar la función
probando diferentes valores.*/


//1
function coviertePulgadas(pulgadas){
  let resultado= pulgadas *2.54;
  return resultado;
}

//2 
function url(nombre){
    return "http://www." + nombre + ".com";
}

//3
function exclamacion(frase){
    return "¡"+frase+"!";
}

//4
function edadDePerro(anios){
    return anios *7;
}

//5
function horaDeTrabajo(sueldo){
    let horasAlMes =40;
    return sueldo/ horasAlMes;
}

//6
function calculadoraDeIMC(peso, altura) {

    const IMC = peso / (altura * altura)

    console.log(IMC);
}

calculadoraDeIMC(83.5, 1.7);

/*Si llegamos hasta este punto estamos más que satisfechos. Ahora te dejamos unos
ejercicios con una dificultad extra. Vas a tener que buscar algunos conceptos por tu
cuenta para poder resolver estos ejercicios. Esta es una práctica que los
programadores realizamos todos los días. Como siempre te decimos, una parte
importante del aprendizaje en programación es ignorar la complejidad, e ir
estrictamente a lo que necesitamos. Sabemos que no es una práctica fácil de realizar,
pero con el tiempo va a ir haciéndose más fácil y divertida.

1. Crear una función que recibe un string en minúscula, lo convierta a
mayúsculas y lo retorne. Pista: investigá qué hace el método de strings:
toUpperCase()
2. Crear una función que recibe un parámetro y devuelve qué tipo de dato
es ese parámetro. Pista: te servirá revisar qué hace la palabra reservada
typeof.
3. Crear una función a la que le pasamos el radio de un círculo y nos
devuelve la circunferencia. Pista: investigá si el objeto Math tiene entre sus
propiedades el número pi. */


// 1  extra

function enMayusculas(palabra){
    let mayusculas= palabra.toUpperCase();
    return mayusculas;
}

//2
function tipoDeDato(valor) {
    return typeof valor;
  }
//3
function circunferenciaDeCirculo(radio) {
    return 2 * Math.PI * radio;
  }
  