/* Operando Lógicamente
Llegó el momento de poner en práctica toda esta información acerca de los
operadores y cómo podemos utilizarlos para crear secuencias lógicas y de
comparación, para ello vamos a realizar una serie de ejercicios que nos ayuden a eso
(y probablemente nos hagan pensar un poco). */

/* ¿Qué devuelve cada Expresión? Pt1
Observen estos ejemplos y piensen qué devuelve cada uno:

1. !true  
false

2. !false
true

3. !!false
false

4. !!true
true

5. !1
false

6. !!1
true

7. !0
true

8. !!0
false

9. !!""
false

10.let x = 5 ;
let y = 9;

a. x < 10 && x!==5
false

b. x>9 || x===5
c. !(x===y)

true
 */

/* 
¿Qué devuelve cada Expresión? Pt2
Sin probar en la consola, piensen qué devolverá cada una de estas expresiones, ¿son
true o false?

1. let x=10
let y ="a"
y==="b" || x >= 10
true

2. let x=3
let y=8
!(x == "3" || x === y) && !(y !== 8 && x <= y)
false

3. let str = ""
let msj = "jaja!"
let esGracioso = "false"
!((str || msj) && esGracioso)
false

 */


/* Code
Crear el código JS que exprese los siguientes enunciados:
1. Para subir a una montaña rusa la edad debe ser mayor a 12 años y la altura
debe ser mayor a 1,30 m.*/

let edad = 8; 

if (edad < 0) {
  console.log("Error, edad inválida. Por favor ingrese un número válido.");
} else if (edad < 18) {
  console.log("No puede pasar al bar.");
} else if (edad == 21) {
  console.log("Bienvenido, felicitaciones por llegar a la mayoria de edad.");
} else if (edad < 21) {
  console.log("Puede pasar al bar, pero no puede tomar alcohol.");
} else {
  console.log("Puede pasar al bar y tomar alcohol.");
}

if (edad % 2 !== 0 && edad > 0 ) {
  console.log("¿Sabías que tu edad es impar? ");
} else {
    null
}


/*2. Si no hay suficiente luz o el objeto se mueve rápidamente, la cámara de fotos
debe usar el flash.*/

function  flash(luz, movimiento) {
    if (luz==false|| movimiento ==true){
        return "Usar flash";
    }
    else {
        return "No usar flash";
    }
}

console.log(flash(true, false));
console.log(flash(false, true));

/*3. Un estudiante pasa de nivel si su nota es mayor a 7 en sus dos evaluaciones
parciales, o si obtiene un 4 en el examen final.*/
function pasarNivel(parcial1, parcial2, final){
    if(parcial1>=7 && parcial2>=7 || final ==4 ){
        return "Pasa de nivel";
    }
    else{
        return "Intenta el próximo año!";
    }
}
console.log(pasarNivel(7,7, 2));


/*4. Dejamos ver la TV a nuestro hijo si realizó la tarea pero además, si tocó sus
prácticas de piano y lo hizo de memoria. */

function tv(tarea,piano,memoria){
  return (tarea==true && (piano==true&&memoria==true))
}
console.log(tv(false,true,true));