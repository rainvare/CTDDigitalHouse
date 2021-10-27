function chorus (animal, sonido){
const texto =
"Oh, Mc Donald saraza tenia un " +
 animal + 
" que hace "  +
 sonido + 
 ", " + 
 sonido +
  ", " + 
sonido;

return texto;
}


console.log(chorus("cerdo","oink"));
console.log(chorus("vaca","muuu"));


// Actividad en mesa de trabajo - clase 5

function test(x,y){
  return x*2
  console.log (x)
  return x/2
}
 test(10)


// 1 Crear una función que convierta pulgadas en centímetros. Es decir, recibe por parámetro pulgadas y retorna su equivalente en centímetros.

function convertir(pulgadas){
const cm = 2.54;
let resultado = pulgadas * cm;
console.log(resultado);
}

// 2 Crear una función que recibe un string y lo convierte en una URL. Ejemplo: “pepito” es devuelto como “http://www.pepito.com”.

function web(dominio){
  const web= "http://www." + dominio + ".com";
  return web;
};


// 3 Crear una función que recibe un string y devuelve la misma frase, pero con admiración. 

function exclamacion(frase){
const exclama = frase + "!";
return exclama;
}

// 4 Crear una función que calcule la edad de los perros, considerando que 1 año para nosotros son 7 de ellos. 
function edadPerro(edad){
  const calculo = edad * 7;
 return calculo;
}


// 5 Crear una función que calcule el valor de tu hora de trabajo, introduciendo tu sueldo mensual como parámetro. Considera que tu mes de trabajo tiene 40 horas.
function calcula (sueldo){
  const horasDeTrabajo =40;
  return sueldo / horasDeTrabajo;
}


// 6 Crear la función calculadorIMC() que reciba la altura en metros y el peso en kilogramos y calcule el IMC de una persona. Luego, ejecutar la función probando diferentes valores.
function calculadorIMC(peso, altura) {
  const IMC = peso / (altura * altura);
  return IMC;
}
