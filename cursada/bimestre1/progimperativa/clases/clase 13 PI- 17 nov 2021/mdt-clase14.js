
/*  =================================================================
Te proveemos la siguiente plantilla que tiene tres partes:
 - Array de objetos que está colapsado aquí debajo.
 - Desarrollo de las consignas, donde escribirás el código que responda a los enunciados
 - Ejecución de las consignas, donde ejecutarás los métodos correspondientes mostrando por consola sus resultados 
================================================================= */


/*******************************/
/* Desarrollo de las consignas */
/*******************************/

  // A. Hacer un objeto llamado inmobiliaria, con una propiedad "departamentos", y utilizar los array suministrados
const  inmobiliaria = {
  departamentos: [
    {
      id: 1,
      propietarios: "Dueño: Luis Perez",
      ambientes: 2,
      disponible: true,
      aceptaMascotas: true,
      cantidadPersonas: 2,
      precioAlquiler: 42700,
    },
    {
      id: 2,
      propietarios: "Dueñas: Martinez Hnas",
      ambientes: 1,
      disponible: false,
      aceptaMascotas: true,
      cantidadPersonas: 2,
      precioAlquiler: 29000,
    },
    {
      id: 3,
      propietarios: "Dueña: Laura García",
      ambientes: 2,
      disponible: false,
      aceptaMascotas: false,
      cantidadPersonas: 3,
      precioAlquiler: 53000,
    },
    {
      id: 4,
      propietarios: "Dueña: Julieta Tols",
      ambientes: 1,
      disponible: true,
      aceptaMascotas: true,
      cantidadPersonas: 1,
      precioAlquiler: 17900,
    },
    {
      id: 5,
      propietarios: "Dueño: Pablo Groming",
      ambientes: 1,
      disponible: false,
      aceptaMascotas: false,
      cantidadPersonas: 1,
      precioAlquiler: 24100,
    },
    {
      id: 6,
      propietarios: "Dueñas: Martinez Hnas",
      ambientes: 2,
      disponible: false,
      aceptaMascotas: true,
      cantidadPersonas: 3,
      precioAlquiler: 46700,
    },
    {
      id: 7,
      propietarios: "Dueño: Alberto Direck",
      ambientes: 2,
      disponible: true,
      aceptaMascotas: true,
      cantidadPersonas: 2,
      precioAlquiler: 37000,
    },
    {
      id: 8,
      propietarios: "Dueña: Maria Gonzalez",
      ambientes: 4,
      disponible: false,
      aceptaMascotas: true,
      cantidadPersonas: 5,
      precioAlquiler: 84000,
    },
    {
      id: 9,
      propietarios: "Dueña: Martina García",
      ambientes: 3,
      disponible: true,
      aceptaMascotas: true,
      cantidadPersonas: 5,
      precioAlquiler: 74000,
    },
    {
      id: 10,
      propietarios: "Dueña: Cristina Foldati",
      ambientes: 3,
      disponible: false,
      aceptaMascotas: true,
      cantidadPersonas: 3,
      precioAlquiler: 55800,
    },
    {
      id: 11,
      propietarios: "Dueño: Ramiro Orwel",
      ambientes: 3,
      disponible: true,
      aceptaMascotas: true,
      cantidadPersonas: 4,
      precioAlquiler: 68000,
    },
    {
      id: 12,
      propietarios: "Dueño: Juan Goldstein",
      ambientes: 3,
      disponible: false,
      aceptaMascotas: true,
      cantidadPersonas: 4,
      precioAlquiler: 63000,
    },
    {
      id: 13,
      propietarios: "Dueño: Juan Pablo Martinez",
      ambientes: 2,
      disponible: true,
      aceptaMascotas: true,
      cantidadPersonas: 2,
      precioAlquiler: 43200,
    },
    {
      id: 14,
      propietarios: "Dueños: Ramirez y asociados",
      ambientes: 2,
      disponible: true,
      aceptaMascotas: true,
      cantidadPersonas: 2,
      precioAlquiler: 40000,
    },
    {
      id: 15,
      propietarios: "Dueños: Martín Gutierrez y José Torres",
      ambientes: 1,
      disponible: false,
      aceptaMascotas: true,
      cantidadPersonas: 1,
      precioAlquiler: 21500,
    },
    {
      id: 16,
      propietarios: "Dueñas: Olga Fernandez y Victoria Paz",
      ambientes: 1,
      disponible: false,
      aceptaMascotas: true,
      cantidadPersonas: 1,
      precioAlquiler: 28000,
    },
    {
      id: 17,
      propietarios: "Dueños: Ramirez y asociados",
      ambientes: 1,
      disponible: true,
      aceptaMascotas: true,
      cantidadPersonas: 1,
      precioAlquiler: 23000,
    },
  ],
  
// mesas de trabajo
/*

a- Agregar un método que permita alquilar un departamento. 
Este método recibe por parámetro el id del departamento y actualiza la propiedad del departamento en false.
retorna un mensaje: “departamento con id: {{2}} está alquilado”
Resultado esperado: que quede actualizada la propiedad de departamentos de la inmobiliaria, donde el departamento que alquilo no está disponible.


b - Agregar un método filtrarPetFriendly que permita filtrar los departamentos que admiten mascotas.
retorna un array con los departamentos que aceptan mascotas

c - Agregar un método rebajasPorNoAlquiler que realice un descuento del 10% a los que no estén alquilados. 
retorna un array con departamentos disponibles con el precio de alquiler rebajado en un 10%.

d - Agregar un método buscarPorPropietarios que permita filtrar los departamentos según su propietario.
Recibe como parámetro un string con el nombre de un propietario
Este método debe devolver una lista de departamentos que tengan como propietario al nombre que pasamos por parámetro. Puede ser único propietario o en conjunto. (Pista: deben buscar ese nombre en los propietarios)
*/

// A
  alquilarDepartamento: function(id){
      let mensaje;
      let mensajeError= "Error"
      for(let i= 0; i< this.departamentos.length; i++){
          if(id === this.departamentos[i].id ){
              this.departamentos[i].disponible = false;
          mensaje= "departamento con id " + id + " está alquilado";
          }
      }
  if(mensaje){
      return mensaje;
  } else{
      return mensajeError;
  }

  },

// B
filtrarPetFriendly: function() {
  let petFriendlyDptos = [];
  for (let i = 0; i < this.departamentos.length; i++) {
    if (this.departamentos[i].aceptaMascotas) {
      petFriendlyDptos.push(this.departamentos[i]);
    }
  }
  return petFriendlyDptos;
},



// C 

rebajasPorNoAlquiler: function () {
  let disponibles = this.departamentosDisponibles();
  const descuento = 0.9;
  let rebajados = [];
  for (let i = 0; i < disponibles.length; i++) {
    rebajados.push((disponibles[i].precioAlquiler *= descuento));
  }
  return rebajados;
},


// D
buscarPorPropietarios: function (propietarios) {
  let filtrados = [];
  for (let i = 0; i < this.departamentos.length; i++) {
    if (this.departamentos[i].propietarios.indexOf(propietarios) != -1) {
      filtrados.push(this.departamentos[i]);
    }
  }
  return filtrados;
}

};
// Resultado 

console.log(inmobiliaria.alquilarDepartamento(14));
console.log(inmobiliaria.filtrarPetFriendly());
console.log(inmobiliaria.rebajasPorNoAlquiler());
console.log(inmobiliaria.buscarPorPropietarios("Luis Perez"));