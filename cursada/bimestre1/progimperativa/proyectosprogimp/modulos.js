/* 1

Exportar array
Tenemos un array de películas y necesitamos poder compartirlo con otras partes del sistema.

Nuestro trabajo será almacenar este array en la variable arrayDePeliculas y exportarlo usando
módulos.*/

let arrayDePeliculas=["Harry Potter","Her", "Up", "Lego"];
module.exports = arrayDePeliculas;

/* 2

Importar modulos
Vamos a practicar la importación de los módulos, ya que es algo que usaremos permanentemente.

Nuestro objetivo será crear 3 variables: moduloNativo, moduloInstalado y moduloPropio, en donde cada una almacenará un módulo distinto.

La primera deberá requerir el módulo http, la segunda el módulo axios y la tercera un módulo local exportado del archivo miFuncion.js. Este último archivo se encuentra en la misma carpeta que nuestro index.js.*/
let moduloNativo= require("http");
let moduloInstalado= require("axios");
const moduloPropio= require("./miFuncion");

/* 3
Requerir modulos
Desde un nuevo archivo queremos acceder a los datos que expone el archivo perro.js. Este expone un objeto literal que tiene los atributos nombre y edad.

Nuestro trabajo será crear la variable perro y requerir el módulo perro.
Luego, debemos hacer un console.log() para mostrar los datos usando la siguiente frase:

"El perro se llama _____ y tiene ___ años"
*/

let perro = require('./perro');

console.log("El perro se llama "+ perro.nombre + " y tiene "  + perro.edad + " años");

