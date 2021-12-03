/* 1. Loop de Pares
Debés crear una función llamada loopDePares que reciba como parámetro un número
y haga un loop de 0 a 100 mostrando en la consola cada número del loop.
En caso de que el número de la iteración sumado con el número pasado por
parámetro, sea par, mostrará en la consola: “El número x es par” */

function loopDePares(numero){
 for(let i = 0;i <=100 ; i++){
   if( (i+numero) % 2 == 0 ){
      console.log(`el numero ${numero} es par`)
   }
   else{
     console.log(i)
   }
 }
}
loopDePares(8);

/* 2. Loop de impares con palabra
Debés crear una función llamada loopDeImpares que reciba como parámetro un
número y una palabra y haga un loop de 0 a 100 mostrando en la consola cada
número del loop.
Ahora, modificar el código para que, en caso de que ese número sumado con el
número pasado por parámetro sea impar, muestre en la consola la palabra pasada
por parámetro. */
function loopDeImpares(numero, palabra){
  for(let i = 0;i <=10 ; i++){
    if( (i+numero) % 2 != 0){
      console.log(palabra)
    }
 }
}
loopDeImpares(31,'impar');



/* 1
3. Sumatoria
Debés crear una función llamada sumatoria que reciba un número como
parámetro y que devuelva la sumatoria de todos sus números anteriores, incluso ese
mismo.
Ejemplo:
sumatoria(3) debe retornar 6 por que hace (1 +2 +3)
sumatoria(8) debe retornar 36 */
function sumatori(numero){
  return (numero * (numero + 1))/2;
}
console.log(sumatoria(5));



/* 4. Nuevo Arreglo
Debés crear una función llamada nuevoArreglo que reciba un número como
parámetro y que devuelva un nuevo arreglo con tantos elementos como el número
que le hayas pasado.
Ejemplo:
nuevoArreglo(5) debe retornar [1,2,3,4,5]
nuevoArreglo(10) debe retornar [1,2,3,4,5,6,7,8,9,10] */

function nuevoArreglo(numero){
  let arreglo = []
  for(let i=1;i<=numero;i++){
    arreglo.push(i);
  }
  return arreglo;
}
console.log(nuevoArreglo(10));

/* 
2
5. Similar String.split()
Debés crear una función llamada split que reciba un string y simule el
comportamiento de la función original Si no sabés cómo funciona, Google puede
ayudarte..
Importante: No podés usar el String.split()
Ejemplo:
split(“hola”) debe retornar [“h”,”o”,”l”,”a”]
split(“chau”) debe retornar [“c”,”h”,”a”,”u”] */
function split(string){
  let arreglo = []
  for(let i=0;i<string.length;i++){
    arreglo.push(string[i]);
  }
  return arreglo;
}
console.log(split('chau'));


/* 6. Carácter del medio
Debés crear una función llamada caracterDelMedio que reciba un string por parámetro
y devuelva sus caracteres del medio.
Ejemplo:
caracterDelMedio(“Digital House”) debe retornar “l”
caracterDelMedio(“hola”) debe retornar “ol”
caracterDelMedio(“cosas”) debe retornar “s” */

function middleCharacter(string1){
  let medio = string1.length;
  // console.log(Math.floor(medio/2));
  if(medio % 2 != 0){
    console.log(string1.charAt(Math.floor(medio/2)))
  }else{
    console.log(string1.slice(Math.floor(medio/2)-1,Math.floor(medio/2)+1))
  }
}
middleCharacter('DigitalHouse');


/* 3
7. Mover ceros a lo último
Debés crear una función llamada moverCeros que reciba un arreglo como parámetro y
devuelva otro con los números 0 ordenados al final.
Ejemplo:
moverCeros([false,1,0,1,2,0,1,3,"a"]) debe retornar [false,1,1,2,1,3,"a",0,0]
moverCeros([1,2,0,1,0,1,0,3,0,1]) debe retornar [1,2,1,1,3,1,0,0,0,0]*/
function moveZeros(arreglo){
    let arregloaux=[]
    let arreglozero=[]
  for(let i= 0;i<arreglo.length;i++){
    if(arreglo[i] != 0){
      arregloaux.push(arreglo[i]);
    }
    else{
      arreglozero.push(arreglo[i]);
    }
  }
  arregloaux.push(arreglozero);
  return arregloaux;
}
console.log(moveZeros([false,1,0,1,2,0,1,3,'a']));




/*
8. Manejando dos arreglos
Debés crear una función llamada arrayHandler que reciba dos arreglos de igual largo
como parámetros y muestre en la consola “Soy {elemento de array 1} y yo soy
{elemento de array 2}”.
Ejemplo:
arrayHandler([1,2,3,4], [“h”,”o”,”l”,”a”]) debe mostrar:
Soy 1 y yo soy h
Soy 2 y yo soy o
Soy 3 y yo soy l
Soy 4 y yo soy a */




/* 4
9. Arreglo de objetos
Debés crear una función llamada arregloDeObjetos que reciba un número como
parámetro y devuelva un arreglo de objetos que tengan una propiedad llamada valor
que contenga el valor del número y sus anteriores.
Ejemplo:
arregloDeObjetos(5) debe retornar [{valor: 1}, {valor: 2}, {valor: 3}, {valor: 4}, {valor: 5}]
arregloDeObjetos(3) debe retornar [{valor: 1}, {valor: 2}, {valor: 3}] */



/* 10. Arreglo de objetos 2
Debés crear una función llamada arregloDeObjetosDos que reciba un número y una
palabra como parámetro y devuelva un arreglo de objetos que tenga: una propiedad
llamada como la palabra pasada por parámetro y el valor del número y sus
anteriores.
Ejemplo:
arregloDeObjetosDos(5, “hola”) debe retornar [{hola: 1}, {hola: 2}, {hola: 3}, {hola: 4}, {hola:
5 }]
arregloDeObjetosDos(3, “chau”) debe retornar [{chau: 1}, {chau: 2}, {chau: 3} */