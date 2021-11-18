/* 
    -VARIABLES, ASIGNACION DE VALORES
    -TIPO DE DATOS
    -OPERADORES (ASIGNACION Y MATEMATICOS)
    -FUNCIONES (DECLARADAS, EXPRESADAS) PARAMETROS POR DEFECTO
*/
//NIVEL I
let sumar = function(a, b){
    return a+b;
}
let restar = function(a,b){
    return a-b;
}
let multiplicar = function(a,b){
    return a*b;
}
let dividir = function(a,b){
    return a/b;
}

/* console.log("***** NIVEL II *****");

console.log("suma (3,6)");
console.log(sumar(3,6));

console.log("resta (3,6)");
console.log(restar(3,6));

console.log("multiplicar (3,6)");
console.log(multiplicar(3,6));

console.log("multiplicar (3,0)");
console.log(multiplicar(3,0));

console.log("dividir (3,6)");
console.log(dividir(3,6));

console.log("dividir (3,6)");
console.log(dividir(3,0));

console.log("**********"); */
 
/* NIVEL III */
function  cuadradoDeUnNumero(n){
    return multiplicar(n,n)
}

function promedioDeTresNumeros(a,b,c){
    let sum = sumar(a,b);
    return sumar(sum,c)/3;
}

function calcularPorcentaje(numero ,porcentaje){
   return multiplicar(numero, dividir(porcentaje,100));
}

function generadorDePorcentaje(a, b){
    let primeraOperacion = multiplicar(a,100);
    let segundaOperacion = dividir(primeraOperacion,b);
    return segundaOperacion;
    // return dividir(multiplicar(a,100),b)
}

/* console.log("***** NIVEL III *****");

console.log("cuadradoDeUnNumero (3)");
console.log(cuadradoDeUnNumero(3));

console.log("promedioDeTresNumeros (3,6,9)");
console.log(promedioDeTresNumeros(3,6,9));

console.log("calcularPorcentaje (100, 10)");
console.log(calcularPorcentaje(100, 50)+"%");

console.log("generadorDePorcentaje (30,500)");
console.log(generadorDePorcentaje(30,500));

console.log("**********"); */

/****** -- NIVEL IV -- ******/

let potencia = function(nro,exponente){
    return nro**exponente;
}
function dividirV2(a,b){ 
    return !b && "divisor es cero" || a/b
    // return   b > 0  &&  a/b  || "Dividendo o divisor es cero";
}


/* console.log("*********NIVEL IV*********")
console.log("\n")

console.log("potencia de 4 elevado al exponente 2")
console.log(potencia(4,2))
console.log("potencia de 3 elevado al exponente 5")
console.log(potencia(3,5))
console.log("\n")

console.log("DIVISION COMPROBACIONES DE 0")
console.log(dividirV2(30,3))
console.log(dividirV2(30,7))
console.log(dividirV2(30,0))
console.log(dividirV2(0,3))
console.log(dividirV2(0,0))
console.log(dividirV2(10,0))
 */
