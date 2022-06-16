/* Primer Parcial de Programación Imperativa
Les damos la bienvenida al primer parcial de Programación Imperativa donde se evaluarán los temas vistos hasta el momento tanto sincrónica como asincrónicamente. ¡No olviden completar los datos personales!
Por otro lado, les contamos que las notas serán enviadas en los días posteriores de manera individual y vía e-mail. 
¡Les deseamos muchos éxitos y sigamos construyendo el proceso de enseñanza y aprendizaje juntos! */
/* 1
Dada la siguiente función, ¿Que se imprimirá por la pantalla luego de ejecutada la misma?
*/
function div(n1, n2){
  if (n1 % n2 === 0){
    console.log(true)
  }
  else{
    console.log(false)
  }
}

div(15,2)
/*El numero 15 es divisible por 2.
-->El numero 15 NO es divisible por 2. */


/* 2
Dada la siguiente función, ¿Que se imprimirá por la pantalla luego de ejecutada la misma?
*/
let adivina = function (n){
    let numSecreto=6;
    if (n>10 || n<1){
      console.log("ingresa un numero entre el 1 y el 10");
    }
    else if(numSecreto === n){
      console.log("acertaste")
    }
    else{
      console.log("no acertaste")
    }
  }
  
  console.log(adivina(6))

/*
-->¡¡Felicidades Santiago, acertaste!! (número ingresado: 6; número secreto: 6).
Lo siento Santiago, el número ingresado (6) no coincide con el número secreto, inténtalo nuevamente
Por favor ingrese un número entre 1 y 10  */



/* 3
Dada la siguiente función, ¿Que se imprimirá por la pantalla luego de ejecutada la misma?
*/
function saludar(nombre, hora){
    if (hora<0|| hora>23){
      console.log("hora invalida")
    }
    else if (hora<=17){
      console.log("hola, " + nombre + ". Son las " + hora);
    }
    else{
        console.log("hola, " + nombre + ". Son las " + hora + "Hasta mañana");
    }
  }
  
  console.log(saludar("Karina",24));

/*
-->Por favor ingrese una hora valida
Hola Karina!. Son las 24:00hs
Son las 24:00hs. Hasta mañana Karina!! */


/* 5
 Mayor, menor o igual
Crear una función llamada mayorMenorIgual, la cual recibe 2 parámetros numéricos, y deberá indicar si el número es menor, mayor o igual al segundo parámetro. Deberá retornar el siguiente mensaje según corresponda. Si es menor: “El número (N1) es menor que (N2)”; Si es mayor: "El número (N1) es mayor que (N2)"; Si es igual: "El número (N1) es igual a (N2)". (Al momento de ingresar la respuesta en el form se deberá ingresar la invocación/ejecución de la función). Ej: mayorMenorIgual(15,3) // “El número 15 es mayor que 3” */
function mayorMenorIgual(numero1,numero2){
    if (numero1<numero2){
      return "El número " + numero1 + " es menor que " + numero2;
    }
    else if(numero1>numero2){
      return "El número " + numero1 + " es mayor que " + numero2;
    }
    else{
      return "El número " + numero1 + " es igual que " + numero2;
    }
  };
  
  console.log(mayorMenorIgual(15,3));


/*6 
Generaciones
Crea una función llamada generacion, la cual reciba por parámetro el año de nacimiento y retorne la generación a la que pertenece según las siguientes características: "Baby boomer" si es menor o igual a 1964"; Generación X" si es entre 1965 y 1981; "Millennial" si es entre 1982 y 1997"; Generación Z" si es mayor a 1997. (Al momento de ingresar la respuesta en el form se deberá ingresar la invocación/ejecución de la función). Ej: generacion(1993) // "Millennial" */
function generacion(anio){
    if (anio<=1964){
      return "Baby boomer";
    }
    else if (anio==1965 || anio<=1981){
      return "Generación X";
    }
    else if(anio==1982 || anio <=1997){
      return "Millennial";
    }
    else{
      return "Generación Z";
    }
  }

console.log(generacion(1998));

/* 7
Más o Menos de 100
Crear la función mayorMenorQue100, la misma recibe dos números como parámetro. Deberá sumarlos y retornar “La suma de (N1) y (N2), es menor que 100” en el caso que la suma de ambos sea menor que 100; “La suma de (N1) y (N2), es mayor que 100” si dicha suma es mayor; o “La suma de (N1) y (N2) es exactamente 100” en el caso de que la suma de 100. (Al momento de ingresar la respuesta en el form se deberá ingresar la invocación/ejecución de la función). Ej.: mayorMenorQue100(57, 43) // “La suma de 57 y 43 es exactamente 100” */
function mayorMenorQue100(numero1,numero2){
    let suma= numero1 +numero2;
  if(suma<100){
      return ("La suma de " + numero1 + " y " + numero2 + " es menor que 100");
    }
     if(suma>100){
      return ("La suma de " + numero1 + " y " + numero2 + " es mayor que 100");
    }
    else{
       return ("La suma de " + numero1 + " y " + numero2 + " es exactamente 100");
    }
  }
  
  console.log(mayorMenorQue100(57,43));