/* El uso del IF es MUY común, y nos sirve mucho para manejar rangos en la condición a diferencia del switch, podemos manejar múltiples caminos lógicos */

let dia = 24

if (dia >= 15 && dia <= 30 ) {
    console.log("Esla 2da quincena del mes")
} else {
    console.log("Esla 1era quincena del mes")
}

/* IF ternario, pensado para chequear una lógica corta */

console.log(dia >= 15 && dia <= 30 ? "Esla 2da quincena del mes" : "Esla 1era quincena del mes")