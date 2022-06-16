// Te proveemos la siguiente plantilla que tiene tres partes:
// - Desarrollo de las consignas, donde escribirás el código que responda a los enunciados, el cual parte de un obj. literal creado con una prop libros que contiene nuestra base de datos.
// - Ejecución de las consignas, donde ejecutarás los métodos correspondientes mostrando por consola sus resultados.
/***********************************/
/* ↧ Desarrollo de las consignas ↧ */
/***********************************/
const bookstore = {
  libros: [
    {
      titulo: "Los Dias del Venado",
      autor: "Liliana Bodoc",
      editorial: "Debolsillo",
      fechaPublicacion: 2018,
      stock: 76,
      precio: 1399,
    },
    {
      titulo: "Los Dias de la Sombra",
      autor: "Liliana Bodoc",
      editorial: "Debolsillo",
      fechaPublicacion: 2018,
      stock: 29,
      precio: 1399,
    },
    {
      titulo: "Los Dias del Fuego",
      autor: "Liliana Bodoc",
      editorial: "Debolsillo",
      fechaPublicacion: 2018,
      stock: 65,
      precio: 1650,
    },
    {
      titulo: "El Silmarillion",
      autor: "J.r.r. Tolkien",
      editorial: "Minotauro",
      fechaPublicacion: 2010,
      stock: 7,
      precio: 2550,
    },
    {
      titulo: "Trilogia El Señor De Los Anillos",
      autor: "J.r.r. Tolkien",
      editorial: "Minotauro",
      fechaPublicacion: 2002,
      stock: 10,
      precio: 7770,
    },
    {
      titulo: "El Resplandor",
      autor: "Stephen King",
      editorial: "Debolsillo",
      fechaPublicacion: 2012,
      stock: 51,
      precio: 2599,
    },
    {
      titulo: "Doctor Sueño",
      autor: "Stephen King",
      editorial: "Debolsillo",
      fechaPublicacion: 2016,
      stock: 42,
      precio: 2599,
    },
    {
      titulo: "La Sombra",
      autor: "John Katzenbach",
      editorial: "Ediciones B",
      fechaPublicacion: 1995,
      stock: 85,
      precio: 2149,
    },
    {
      titulo: "Primera Persona Del Singular",
      autor: "Haruki Murakami",
      editorial: "Tusquets",
      fechaPublicacion: 2021,
      stock: 60,
      precio: 1790,
    },
    {
      titulo: "Fuego y Sangre",
      autor: "George r.r. Martin",
      editorial: "Plaza & Janes",
      fechaPublicacion: 2018,
      stock: 78,
      precio: 4449,
    },
  ],
 /*  A.	Agregar un método buscarPorTitulo que permita buscar dentro de la propiedad de nuestro objeto bookstore un libro por su título, el cual deberá ser igual al titulos que se envía como argumento al momento de invocarlo. 
○	Este método deberá retornar un libro. */
buscarPorTitulo: function (libro){
    let titulolibro;
    let error = "no encontrado";
    for(let i = 0; i < this.libros.length; i++){
      if(this.libros[i].titulo === libro){
       titulolibro = this.libros[i];
      }
    }
    return titulolibro ? titulolibro : error;
  },
  

/* B.	Agregar un método buscarPorAutor que permita buscar a todos los libros que sean del autor indicado como parámetro
○	Este método deberá retornar un array de libros cuyo autor sea el mismo.
 */
buscarPorAutor: function (autor) {
    let librosResultado= [];
    let error = "No se encontró autor";
    for (let i = 0; i <this.libros.length; i++) {
      if (this.libros[i].autor === autor ) {
      librosResultado.push(this.libros[i]);
      }
    }
    if (librosResultado.length > 0) {
      return librosResultado;
    } else {
      return error;
    }
  },

/* C.	Agregar un método filtrarPorPrecio que permita filtrar los libros en función de su precio, es decir, todos los libros cuya propiedad precio sea menor o igual a la indicada por parámetro 
○	Este método deberá retornar un array de libros.
 */
filtrarPorPrecio: function (precio) {
    let librosResultado= [];
    let error = "No se encontró libro de ese precio";
    for (let i = 0; i <this.libros.length; i++) {
      if (this.libros[i].precio <= precio) {
      librosResultado.push(this.libros[i]);
      }
    }
    if (librosResultado.length > 0) {
      return librosResultado;
    } else {
      return error;
    }
  },


/* D.	Agregar un método modificarStock que permite cambiar el stock de un libro determinado. Este método recibe dos parámetros, el título del libro a modificar, y la nueva cantidad de stock
○	Reutiliza el método buscarPorTitulo para obtenerlo.
○	Una vez encontrado el libro deberá cambiar el valor de la propiedad stock a la indicada por parámetro.
○	Retorna el libro. */
modificarStock: function (titulo, stock) {
    let mensaje
    let mensajeError =
      "No quedan libros de este titulo";
     
    for (let i = 0; i < this.libros.length; i++) {
      if (this.libros[i].stock <= stock && this.buscarPorTitulo(titulo)) {
        this.libros[i].stock = stock;
        mensaje = this.libros[i];
      }
    }
    if (mensaje) {
      return mensaje;
    } else {
      return mensajeError;
    }
  },


/* E.	Agregar un método precioPromedio que permita consultar el promedio de precio de libros.
○	El método deberá recorrer el listado de libros y calcular el promedio de la propiedad precio.
○	El método deberá retornar un mensaje con el siguiente formato.
ej:  “El precio promedio de cada libro es de: $1800.” */
/* precioPromedio: function () {
let promedio;
    for (let i = 0; i < this.libros.length; i++) {
      promedio = this.libros[i].precio / this.libros.length;
    }
    return `El precio promedio de cada libro es de: ${promedio}`;
  } */
  precioPromedio(){
    let sumaPrecios=0;
    let promedioPrecios=0;
    for(i=0;i<this.libros.length;i++){
      sumaPrecios+=this.libros[i].precio;
    }
    promedioPrecios=sumaPrecios/ this.libros.length
    return  "El precio promedio de cada libro es de: $"+promedioPrecios ;

};

/***********************************/
/*   ↧ Ejecución de consignas ↧    */
/***********************************/
console.log("---------- ↧ Punto A ↧ ----------");
// Ejecución aquí ↧
console.log(bookstore.buscarPorTitulo("Fuego y Sangre"));
console.log("---------------------------------");

console.log("---------- ↧ Punto B ↧ ----------");
// Ejecución aquí ↧
console.log(bookstore.buscarPorAutor("Stephen King"));
console.log("---------------------------------");

console.log("---------- ↧ Punto C ↧ ----------");
// Ejecución aquí ↧
console.log(bookstore.filtrarPorPrecio(1600));
console.log("---------------------------------");

console.log("---------- ↧ Punto D ↧ ----------");
// Ejecución aquí ↧
console.log(bookstore.modificarStock("Fuego y Sangre", 80));
console.log("---------------------------------");

console.log("---------- ↧ Punto E ↧ ----------");
// Ejecución aquí ↧
console.log(bookstore.precioPromedio());
console.log("---------------------------------");
