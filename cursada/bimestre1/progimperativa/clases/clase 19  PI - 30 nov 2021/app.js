const archivos = require("./lecturaEscritura");
let arrayProfesionales = archivos.leerJson("profesionales");

//A 
/*  Utilizar un método de array que permita recorrer todo el arrayProfesionales
proporcionado en el archivo app.js. En cada iteración realizaremos la impresión de
dos propiedades de cada objeto en cuestión: nombre - especialidad. Cuando
ejecutemos este método deberíamos visualizar algo como lo siguiente en nuestra
consola:
‘Huber Wilkins - Neumonología’
‘Goldie Haley - Cardiología‘
‘Pena Landry - Dermatología‘ */
console.log('----------------------A--------------------------');


arrayProfesionales.forEach(profesional => {
    console.log(`${profesional.nombre} - ${profesional.especialidad}`)
});

//console.table(arrayProfesionales);


//B
/* Utilizar un método de array que permita recorrer todo el arrayProfesionales y
modificar de cada uno la propiedad honorarioConsulta, incrementado el valor de
la misma en un 5%. Luego imprimir el arrayProfesionales para ver la
modificación realizada.
 */
console.log('----------------------B--------------------------');
console.table(
    arrayProfesionales.map(profesional => profesional.honorarioConsulta += profesional.honorarioConsulta * 5 / 100)
    );


//C
/* Utilizar un método de array que permita recorrer todo el array de profesionales y
retornar profesionales deshabilitados. Es decir, filtrar por la propiedad
estaHabilitado cuando esta sea false. Guardar el retorno de este filtro en una
variable profesionalesDeshabilitados e imprimirla para verificar los objetos
filtrados. */
console.log('----------------------C--------------------------');
const profesionalesDeshabilitados = arrayProfesionales.filter(profesional =>
    !profesional.estaHabilitado );

    console.table(profesionalesDeshabilitados);

//D
/* Utilizar un método de array que permita recorrer todo el array de profesionales y
retornar profesionales habilitados. Es decir, filtrar por la propiedad estaHabilitado
cuando esta sea true. Guardar el retorno de este filtro en una variable
profesionalesHabilitados e imprimirla para verificar los objetos filtrados. */
console.log('----------------------D--------------------------');
const profesionalesHabilitados = arrayProfesionales.filter(profesional =>
    profesional.estaHabilitado

);

console.table(profesionalesHabilitados);


//E
/* Utilizar un método de array que permita recorrer todo el array de profesionales y
retornar profesionales cuya especialidad sea “Arquitecto”. Es decir, filtrar por la
propiedad especialidad cuando esta sea igual a “Arquitecto”. Guardar el retorno
de este filtro en una variable arquitectos e imprimirla para verificar los objetos
filtrados. */
console.log('----------------------E--------------------------');
const arquitectos = arrayProfesionales.filter(profesional => profesional.especialidad === "Arquitecto")

console.table(arquitectos);

//F
/* Utilizar un método de array que permita recorrer todo el array y modificar de cada
uno la propiedad estaHabilitado a true. Se recomienda utilizar la variable
obtenida en el punto C, es decir la variable profesionalesDeshabilitados.
Imprimir el resultado de este método. */
console.log('----------------------F--------------------------');
profesionalesDeshabilitados.map(profesional => profesional.estaHabilitado = true)

console.table(profesionalesDeshabilitados);


//G 
/* Ahora, necesitamos obtener un valor que nos indique la cantidad de consultas
atendidas por todos los profesionales. Para ello utilizaremos un método de array
que nos facilite esto. Asignamos el retorno de este método en una variable
llamada cantidadTotalConsultas, luego debemos imprimirla */
console.log('----------------------G--------------------------');
const cantidadTotalConsultas = arrayProfesionales.reduce((acum, profesional) => acum + profesional.cantidadConsultas, 0);

console.table(cantidadTotalConsultas);


//H 
/* Utilizar un método de array que nos permita retornar un nuevo array de objetos
literales únicamente con las propiedades nombre, especialidad y recaudación
que será el resultado de multiplicar las propiedades cantidadConsulta *
honorarioConsulta. Asignar el retorno de este método a una variable
arrayRecaudacion e imprimirla. La salida por terminal se debería ver así:
[
{
nombre: 'Huber Wilkins',
especialidad: 'Neumonologia',
recaudacion: 4015.36
},
{
nombre: 'Goldie Haley',
especialidad: 'Cardiologia',
recaudacion: 9302.24
}, */

console.log('----------------------H--------------------------');

const arrayRecaudacion = arrayProfesionales.map(profesional => {
    const objectArray = {
        nombre: profesional.nombre,
        especialidad: profesional.especialidad,
        recaudacion: profesional.cantidadConsultas * profesional.honorarioConsulta
    };
    return objectArray;
});

console.log(arrayRecaudacion);