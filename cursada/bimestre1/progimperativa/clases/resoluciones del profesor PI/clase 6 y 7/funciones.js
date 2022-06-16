
//saludar()  dará error porque no declaré antes la función (si uso expresada)

// declarada
/* function saludar() {
    console.log("hola")
}
*/

// expresada
const saludar = function() {
    console.log("hola")
}


saludar()

function sumar(nro1,nro2) { // parámetros (son como variables temporales que sólo funcionaran DENTRO de la función)
   // console.log(nro1 + nro2)
   return nro1 + nro2
}
let resultado = sumar(100,10) // --> nro1 --> 100, nro ---> 10 
console.log("El resultado es " + resultado)
resultado = sumar(15,15) 
console.log("El resultado es " + resultado)

