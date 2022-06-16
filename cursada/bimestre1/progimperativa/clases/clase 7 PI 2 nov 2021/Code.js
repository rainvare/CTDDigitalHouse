//Code
//Crear el código JS que exprese los siguientes enunciados:
//1- Para subir a una montaña rusa la edad debe ser mayor a 12 años y la altura debe ser mayor a 1,30 m.
//2 - Si no hay suficiente luz o el objeto se mueve rápidamente, la cámara de fotos debe usar el flash.
//3- Un estudiante pasa de nivel si su nota es mayor a 7 en sus dos evaluaciones parciales, o si obtiene un 4 en el examen final. 
//4- Dejamos ver la TV a nuestro hijo si realizó la tarea pero además, si tocó sus prácticas de piano y lo hizo de memoria


//1
function entrada(edad, estatura){
    return (edad>12 && estatura>1.30)
  };
  
  console.log(entrada(13,1.40));

  //2
  function flash(luz,movimiento){
      return (luz == true||movimiento== true)
  };
  console.log(flash(true, true));

  //3
  function pasa(parcial1, parcial2, final){
      return (parcial1>7 && parcial2>7)||final==4;
}

  console.log(pasa(8,8, 5));

//4
function tv(tarea,piano,memoria){
    return (tarea==true && (piano==true&&memoria==true))
}
console.log(tv(false,true,true));