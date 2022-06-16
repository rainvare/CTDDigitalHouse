/*
Crear una función puedeSubir() que reciba dos parámetros: altura de la persona y si viene acompañada. Debe retornar un valor booleano (TRUE, FALSE) que indique si la persona puede subirse o no, basado en las siguientes condiciones:
Debe medir más o igual de 1,40m y menos de 2 metros.
Si mide menos de 1,40m hasta 1.20m, deberá venir acompañado.
Si mide menos de 1,20m, no podrá subir ni acompañado.
*/

function puedeSubir(altura,compania = false) { // parámetro por defecto
    if (altura >= 1.4 && altura < 2 ) {
        console.log("puede subir")
        return true
    } else if (altura < 1.4 && altura > 1.2 && compania == true) {
        console.log("Ya que venis en compañia, podes subir")
        return true
    } else {
        console.log("no podrá subir ni acompañado")
        return false
    }
}
puedeSubir(1.30)

function saludar(nombre = "anonimo") {
    return "Hola " + nombre
}
console.log(saludar())