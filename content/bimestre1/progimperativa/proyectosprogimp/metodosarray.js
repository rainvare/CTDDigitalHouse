// 1
/*Si lo juntamos, todo tiene sentido.

Tenemos un array con palabras sueltas que, juntas, forman una gran frase.

Queremos, utilizando un método de array sobre la arrayFrase , convertirlo en una oración entera, y almacenar ese String en una variable llamada fraseNueva.

Ejemplo:

console.log(fraseNueva); // "No he fracasado, simplemente me he topado con diez mil soluciones equivocadas"*/


let arrayFrase = [
    "No",
    "he",
    "fracasado,",
    "simplemente",
    "me",
    "he",
    "topado",
    "con",
    "diez",
    "mil",
    "soluciones",
    "equivocadas"
  ];
  
  
    let fraseNueva=arrayFrase.join(" ");

    //2 
    /*¡Sí! ¡Alexis se egresó del terciario!

Para este ejercicio contamos con el array estudiantes, en donde, en cada índice, almacena un objeto con las propiedades nombre, promedio y curso.

Queremos sacar a Alexis, que acaba de egresar, y sabemos que está último en ese array.

Para eso debemos, utilizando un método de array, guardar los datos de Alexis en una variable nueva llamada alumnoEgresado. */


let estudiantes = [
    {
      nombre: "Alvaro",
      promedio: 9,
      curso: "Android"
    },
    {
      nombre: "Daniel",
      promedio: 6,
      curso: "Full Stack"
    },
    {
      nombre: "Alexis",
      promedio: 3,
      curso: "iOS"
    }
  ];
  
  let alumnoEgresado=estudiantes.pop();

  //3
  /*Se inscribieron dos estudiantes nuevos y queremos agregarlos al final del array estudiantes.

Nuestro trabajo será agregar de a un alumno por vez, utilizando algún método de array.

Los valores de cada uno son:

nombre: Juan

promedio: 5

curso: iOS

------------------

nombre: Miguel

promedio: 2

curso: Android */

let estudiantes = [
    {
      nombre: 'Alvaro',
      promedio : 9,
      curso : 'Android',
    },
    {
      nombre: 'Daniel',
      promedio : 6,
      curso : 'Full Stack',
    },
    {
      nombre: 'Alexis',
      promedio : 3,
      curso : 'iOS',
    },
  ]
  
  let juan= {nombre: 'Juan', promedio: 5, curso: 'iOS'};
  let miguel= {nombre: 'Miguel', promedio: 2, curso: 'Android'};
  
  estudiantes.push(juan);
  estudiantes.push(miguel);


  //4

  /* Se dio de baja un alumno.

Tenemos que dar de baja al primer estudiante y queremos sacarlo del array estudiantes. Para eso, debemos crear una variable llamada alumnoDeBaja y, utilizando un método de array, almacenar en ella a ese primer estudiante.*/

let estudiantes = [
    {
       nombre: 'Alvaro',
       promedio : 9,
       curso : 'Android',
     },
      {
        nombre: 'Daniel',
        promedio : 6,
        curso : 'Full Stack',
      },
      {
        nombre: 'Alexis',
        promedio : 3,
        curso : 'iOS',
      },
    ]

    let alumnoDeBaja=estudiantes.shift();

    //5
    /*Se reintegraron alumnos.
    Tenemos la tarea de reintegrar a dos estudiantes que se habían registrado al principio de todo, se dieron de baja, ¡pero volvieron! Y para que no pierdan su lugar privilegiado queremos, utilizando un método de array, agregar al inicio del mismo a cada estudiante (de a uno a la vez).
    
    Los datos que hay que agregar de cada uno son:
    
    nombre: "Mariana",
    
    promedio: 9,
    
    curso: "Full Stack"
    
    -------------------------
    
    nombre: "Francisco",
    
    promedio: 2,
    
    curso: "Android"*/

    let estudiantes = [
        {
          nombre: 'Alvaro',
          promedio : 9,
          curso : 'Android',
        },
        {
          nombre: 'Daniel',
          promedio : 6,
          curso : 'Full Stack',
        },
        {
          nombre: 'Alexis',
          promedio : 3,
          curso : 'iOS',
        }
      ]
      
      let mariana= {nombre: 'Mariana', promedio: 9, curso: 'Full Stack'};
      let francisco= {nombre: 'Francisco', promedio: 2, curso: 'Android'};
      
      estudiantes.unshift(mariana);
      estudiantes.unshift(francisco);



