// Hagamos una calculadora
/*Con el conocimiento que adquirimos hasta el momento, estamos en condiciones de
desarrollar nuestra primera aplicación, una calculadora, la misma consta de
diferentes niveles de dificultad. Te acompañaremos para superarlos.*/

// Calculadora - Nivel I
/*1. Crear un archivo calculadora.js que contendrá las distintas operaciones a
realizar de nuestra calculadora.
2. Crear una función sumar, esta deberá recibir dos parámetros y retornar la
suma de los mismos.
3. Crear una función restar, la cual deberá recibir dos parámetros y retornar la
resta del primero menos el segundo.
4. Crear una función multiplicar, la misma deberá recibir dos parámetros y
retornar el resultado de su multiplicación
5. Crear una función dividir, la cual recibirá dos parámetros y retorna el resultado
de la división del primero sobre el segundo.*/

//2
function sumar(num1,num2){
return num1+num2;
}

//3
function restar(num1,num2){
    return num1-num2;
}

//4
function multiplicar(num1, num2){
    return num1*num2;
}

//5
function dividir(num1,num2){
    return num1/num2;
}

//Calculadora - Nivel II
/*Superado el Nivel I, agregamos un poco más de dificultad, probaremos nuestras
funciones.
1. En el archivo calculadora.js —debajo de nuestras 4 funciones hechas con
anterioridad— creá un console.log en el cual vas a poner un string para indicar
que debajo de él comenzarás a probar las funciones. Por ejemplo:
console.log(“-------------- Testeo de Operaciones / Calculadora --------------”)
2. Ejecutar la función que permite sumar y la función que permite restar pasando
como argumentos dos números cualesquiera. Mostrar en consola los
resultados.
3. Ejecutar la función que permite multiplicar pasando como argumentos dos
números cualesquiera. Mostrar en consola el resultado.
4. Ejecutar la función que permite dividir pasando como argumentos dos
números cualesquiera. Mostrar en consola el resultado.
5. Ejecutar la función que permite dividir pasando ahora, como uno de los dos
argumentos, el número cero. Mostrar en consola el resultado.


En el punto 5, se nos requiere ejecutar la función dividir, pero si pasamos el cero
como divisor, nos arroja un error. No te preocupes. La idea es familiarizarte con que,
durante toda tu carrera como programador —y durante tu proceso formativo—, vas a
encontrarte con errores. La idea es tratar de aprender a lidiar con esa frustración de
una manera lo más productiva posible. ¡No te desanimes!
*/

console.log("-------------- Testeo de Operaciones / Calculadora --------------");
console.log(sumar(30,15));
console.log(restar(20,5));
console.log(multiplicar(12,6));
console.log(dividir(130,6));

//console.log(dividir(12,0));

//Calculadora - Nivel III - Funciones extras
/*Si llegamos hasta aquí, podemos quedarnos tranquilos con lo realizado. A
continuación desarrollaremos funciones extras a nuestra calculadora, en las cuales
utilizaremos las funciones ya creadas. Podemos realizar la prueba de estas luego de
desarrollar cada una.
1. Crear una función que se llame cuadradoDeUnNumero, la cual recibe un número
como parámetro y deberá retornar ese número elevado al cuadrado.
Importante: cuadradoDeUnNumero() deberá utilizar la función multiplicar() para
calcular el cuadrado del parámetro ingresado a potencia()

2. Crear la función promedioDeTresNumeros, la misma deberá calcular el promedio
de 3 números, que serán ingresados por parámetro.
Importante: promedioDeTresNumeros() deberá utilizar algunas funciones
previamente creadas de nuestra calculadora.

3. Crear la función calcularPorcentaje. Esta recibirá dos parámetros: el número
total y el porcentaje que se le quiere calcular. Deberá retornar el x% del total.
Ejemplo: calcularPorcentaje(300, 15) debe retornar 45, ya que es el 15% de 300.
Importante: calcularPorcentaje() deberá utilizar algunas funciones previamente
creadas de nuestra calculadora.

4. Crear una función GeneradorDePorcentaje que recibe dos parámetros y deberá
retornar el porcentaje del primero con respecto al segundo.
Ejemplo: GeneradorDePorcentaje(2, 200) deberá retornar 1, ya que 2 es el 1% de
200.*/

//1 
function cuadradoDeUnNumero(num){
let cuadrado=Math.pow(num,2)
return cuadrado;
}
console.log(cuadradoDeUnNumero(5))

//2 
function promedioDeTresNumeros(num1,num2,num3){
    let total = sumar(num1,num2) +num3;
    return dividir(total,3);
}

console.log(promedioDeTresNumeros(3,6,8));

//3
function calcularPorcentaje(total,porcentaje){
    let operacion= multiplicar(total,porcentaje);
    let resultado = dividir(operacion,100);
    return resultado;
}

console.log(calcularPorcentaje(300,15));

// 4
function GeneradorDePorcentaje(num1,num2){
    let operacion= dividir(num1, num2);
    return multiplicar(operacion,100);
}
console.log(GeneradorDePorcentaje(2,200));


/****** solución del profe -- NIVEL IV -- ******/

let potencia = function(nro,exponente){
    return nro**exponente;
}
function dividirV2(a,b){ 
    return !b && "divisor es cero" || a/b
    // return   b > 0  &&  a/b  || "Dividendo o divisor es cero";
}
