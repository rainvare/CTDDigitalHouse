// codigo del json helper

/* const fs = require("fs")
const jsonHelper = {
    leerJson: function(nombre){
        return JSON.parse(fs.readFileSync(__dirname+"/"+nombre+".json","utf-8"))
    },
    escribirJson: function(nombre,dato){
        return fs.writeFileSync(__dirname+"/"+nombre+".json",JSON.stringify(dato))
    }
}
module.exports = jsonHelper */
//---------------------------------------------------------------------------------------------------------------------------------
//codigo para leer / escribir sin un module o sin hacerlo con metodos desde un objeto (json helper)

/* const fs = require("fs")

const jsonLeidoLista = JSON.parse(fs.readFileSync("./archivo.json","utf-8")) 

fs.writeFileSync(__dirname+"/NOMBRE.json",JSON.stringify("variable")) */ // es la variable que tiene la info que quiero escribir en otro lado
//-------------------------------------------------------------------------------------------------------------------------------

// MAP
// MAP -> toma un array y devuelve un nuevo array modificado conforme necesitemos,
const numeros = [2, 4, 6]
const elDoble = numeros.map(elemento => elemento * 2) // multiplica por 2 cada elemento del array
console.log("_____________________ MAP _______________________")
console.log(elDoble) // [ 4, 8, 12 ]

//-------------------------------------------------------------------------------------------------------------------------------
// FILTER
// FILTER - recorre el array y filtra elementos segun condicion -> devuelve array nuevo.
const edades = [22, 8, 17, 14, 30]
const mayores = edades.filter(elemento => elemento > 19) // filtra los elementos del array mayores a 18
console.log("_____________________ FILTER _______________________")
console.log(mayores) // [22, 30]

//-------------------------------------------------------------------------------------------------------------------------------
// REDUCE
// REDUCE - recorre el array y devuelve un unico valor -> devuelve un unico valor
// 5 parametros, minimo 2 -> ACUMULADOR - ELEMENTO - posicion - array - INICIALIZADOR (del acumulador, importante declarar para propiedades de objetos)
const electronicos = [{
    nombre: 'iPad Pro 12"',
    precioEnUsd: 2200,
    cantVendidos: 15
}, {
    nombre: "Macbook Air",
    precioEnUsd: 1500,
    cantVendidos: 20
}]
const gananciaTotal = electronicos.reduce((acumulador, elemento) => acumulador + elemento.precioEnUsd * elemento.cantVendidos, 0 /* inicializador en 0 */ )
console.log("_____________________ REDUCE _______________________")
console.log(gananciaTotal) // 63000

//-------------------------------------------------------------------------------------------------------------------------------
// FOREACH
// FOREACH - itera sobre un array, no retorna nada. -> puede indicarse el indice despues del elemento que sera trabajado en cada iteracion, como en el for.
// .forEach(elemento,indice)
console.log("_____________________ FOREACH _______________________")
const paises = ['Venezuela', 'Argentina', 'Colombia'];
paises.forEach((elemento => console.log(elemento)))

//-------------------------------------------------------------------------------------------------------------------------------
// SLICE
// SLICE - extrae una copia de una parte del array - > determinamos por parametro el inicio y luego el final del fragmento que queremos extraer
const numerosDos = [3, 4, 5, 6, 7];
const subArray = numerosDos.slice(0, 3);
console.log("_____________________ slice _______________________")
console.log(subArray); // [3,4,5]

//-------------------------------------------------------------------------------------------------------------------------------
// SPLICE
// SPLICE - remueve y/o agrega elementos a un array. Recibe 3 parametros.
// INDICE donde inicia, CANTIDAD(opcional) indica cantidad de elementos a elminar si se omite o es mayor a array.length elimina todo desde el inicio.
// ITEM(opcional), indica elementos que se agregaran en el array desde el inicio, si se omite solo elimina.
console.log("_____________________ splice _______________________")
const numeros3 = [3, 4, 5, 6, 7];
numeros3.splice(0, 0, 2); //comienza indice 0, remueve 0 elementos y agrega al principio el valor 2.
console.log(numeros3); // [2,3,4,5,6,7]
numeros3.splice(1, 2); //comienza en el indice 1, borra dos elementos
console.log(numeros3); // [2,5,6,7]

//-------------------------------------------------------------------------------------------------------------------------------
// SORT
// SORT - ordena elementos de un array, recibe como parametro dos elementos, los cuales se compararan mediante una evaluacion para ordenarse.
const numeros4 = [10, 3, 4, 52, 6, 7];
const ordenado = numeros4.sort((elementoA, elementoB) => elementoA - elementoB)     
//si fuese un objeto y tuviese que ordenarse por una propidad, en donde se hace la resta para comparar(final del codigo) 
//tendriamos que poner que propiedad es ej: elementoA.puntaje - elementoB.puntaje
//Y si quisieramos ordenarlo de mayor a menor (menor a mayor es por defecto) tenemos que invertir el elementoA y elementoB (EJ: elementoB - elementoA)
console.log("_____________________ SORT NUMEROS _______________________");
console.log(ordenado) // [ 3, 4, 6, 7, 10, 52 ]

// el orden no es por valor numerico, es por el valor que tienen el unicode (estandar de codificacion de caracteres donde cada simbolo tiene un valor)
// con lo cual si queremos ordenar letras, necesitamos indicarle una estructura de comparacion un poco mas compleja.
console.log("_____________________ letras _______________________")
var items = [{
        name: 'Juan',
        value: 21
    },
    {
        name: 'Pedro',
        value: 37
    },
    {
        name: 'Ana',
        value: 45
    },
    {
        name: 'María',
        value: 32
    },
    {
        name: 'Florencia',
        value: -12
    },
    {
        name: 'Miguel',
        value: 13
    },
    {
        name: 'Daniela',
        value: 37
    }
];
const sortPalabras = items.sort(function (elementoA, elementoB) {
    if (elementoA.name > elementoB.name) {      //si queremos ordenar por una propidad de objeto definimos en la evaluacion que propiedad (EJ: .name)
        return 1;   //el 1 indicara que el elemento ira primero
    }
    if (elementoA.name < elementoB.name) {
        return -1;  //el 2 indicara que el elemento ira despues que el B
    }else {return 0}
});
console.log(sortPalabras)

// algunos de los problemas de unicode es que las mayusculas tienen otros valores, entonce si ordenamos texto y algunas palabras estan en
// mayuscula y otras en minuscula como por ejemplo iniciales, primero ordenara las mayusculas y luego las minusculas ignorando la letra que sea.
// en estos casos cuando evaluamos tenemos que evaluarlos comparandolas como si fueran minusculas.
const sortPalabrasMayusMinus = items.sort(function (elementoA, elementoB) {
    if (elementoA.name.toLowerCase() > elementoB.name.toLowerCase()) {      //si queremos ordenar por una propidad de objeto definimos en la evaluacion que propiedad (EJ: .name)
        return 1;   //el 1 indicara que el elemento ira primero
    }
    if (elementoA.name.toLowerCase() < elementoB.name.toLowerCase()) {
        return -1;  //el 2 indicara que el elemento ira despues que el B
    }else {return 0}
});
console.log("_____________________ letras con Mayus y Minus_______________________");
console.log(sortPalabrasMayusMinus)

//-------------------------------------------------------------------------------------------------------------------------------
// FIND
// FIND -> devuelve el valor del primer elemento de un array que cumpla con funcion especificada, necesita declarar el elemento que sera evaluado
// cada vez que recorra el array y opcionalmente puede indicarse el index donde se comenzara a buscar (esto ultimo del indice no estoy seguro 100% si para eso es el index).
const criptos = [
    {nombre: 'Bitcoin', simbolo: 'BTC'},
    {nombre: 'Ethereum', simbolo: 'ETH'},
    {nombre: 'Cardano', simbolo: 'ADA'}
    ];
    
const encontrarPalabra = nombreBuscado => criptos.find((elemento) => elemento.nombre === nombreBuscado)
console.log("_____________________ FIND_______________________");
console.log(encontrarPalabra("Ethereum"))

// -