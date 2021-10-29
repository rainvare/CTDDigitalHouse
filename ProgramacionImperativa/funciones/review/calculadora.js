//ejercicio clase 6 - 19 oct 2021

//NIvel I
//ejercicio 1
function sumar(n1, n2) {
  return n1 + n2;
}

//ejercicio 2
function restar(n1, n2) {
  return n1 - n2;
}

//ejercicio 3
function multiplicar(n1, n2) {
  return n1 * n2;
}
multiplicar(7, 4);

//ejercicio 4
function dividir(n1, n2) {
  return n1 / n2;
}
dividir(40, 5);

console.log(
  "-------------- Testeo de Operaciones / Calculadora --------------"
);

//Nivel II
//2

//funcion suma
console.log(sumar(4, 5));

//funcion resta
console.log(restar(6, 3));

//funcion multiplicar
console.log(multiplicar(7, 4));

//function dividir
console.log(dividir(40, 5));

//funcion dividir po 0
//console.log(dividir(40,0));
console.log(cuadradoDeUnNumero(7));
console.log(promedioDeTresNumeros(4,6,9));
console.log(calcularPorcentaje(300,15));
//Nivel II

//ejercicio 1
function cuadradoDeUnNumero(n1) {
  return multiplicar(n1, n1);
}

//ejercicio 2
function promedioDeTresNumeros(n1, n2, n3) {
  let suma1 = sumar(n1, n2);
  let sumafinal = sumar(suma1, n3);
  let promedio = dividir(sumafinal, 3);

  return promedio;
}

//ejercicio 3
function calcularPorcentaje(n1,n2){
    let resultado= multiplicar(n1,n2);
    let porcentaje= dividir(resultado/100);
}