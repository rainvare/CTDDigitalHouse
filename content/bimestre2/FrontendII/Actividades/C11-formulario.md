# C11 - Formulario Hogwarts

En el `HTML`

```html
<form>
    <h1>Inscripcion a Hogwarts</h1>
    <label for="nombre">Nombre completo:</label>
    <input type="text" class="" name="nombre" id="nombre" autocomplete="off">
    <label for="pass">Contraseña:</label>
    <input type="password" name="pass" id="pass">
    <label for="tel">Telefono:</label>
    <input type="text" name="tel" id="tel">

    <fieldset id="listado-hobbies">
      <legend>Hobbies: (No mas de 4)</legend>
      <label for="hobbiesNetflix">Netflix</label>
      <input type="checkbox" name="hobbies" id="hobbiesNetflix">

      <label for="hobbiesFutbol">Futbol</label>
      <input type="checkbox" name="hobbies" id="hobbiesFutbol">

      <label for="hobbiesTenis">Tenis</label>
      <input type="checkbox" name="hobbies" id="hobbiesTenis">

      <label for="hobbiesGym">Gym</label>
      <input type="checkbox" name="hobbies" id="hobbiesGym">

      <label for="hobbiesVideoJuegos">VideoJuegos</label>
      <input type="checkbox" name="hobbies" id="hobbiesVideoJuegos">

      <label for="hobbiesCocina">Cocina</label>
      <input type="checkbox" name="hobbies" id="hobbiesCocina">

      <label for="hobbiesProgramacion">Programación</label>
      <input type="checkbox" name="hobbies" id="hobbiesProgramación">

      <label for="hobbiesDibujo">Dibujo</label>
      <input type="checkbox" name="hobbies" id="hobbiesDibujo">

      <label for="hobbiesPintura">Pintura</label>
      <input type="checkbox" name="hobbies" id="hobbiesPintura">

      <label for="hobbiesGuitarra">Guitarra</label>
      <input type="checkbox" name="hobbies" id="hobbiesGuitarra">

      <label for="hobbiesTeclado">Teclado</label>
      <input type="checkbox" name="hobbies" id="hobbiesTeclado">

      <label for="hobbiesTeJER">Tejer</label>
      <input type="checkbox" name="hobbies" id="hobbiesTejer">

      <label for="hobbiesLectura">Lectura</label>
      <input type="checkbox" name="hobbies" id="hobbiesLectura">

      <label for="hobbiesEscritura">Escritura</label>
      <input type="checkbox" name="hobbies" id="hobbiesEscritura">

    </fieldset>

    <fieldset>
      <legend>Pais de nacimiento</legend>
      <label for="nacionalidadArgentina">Argentina </label>

      <input type="radio" name="nacionalidad" id="nacionalidadArgentina">
      <label for="nacionalidadColombiana">Colombia </label>

      <input type="radio" name="nacionalidad" id="nacionalidadColombiana">
      <label for="nacionalidadBrazilera">Brazil </label>

      <input type="radio" name="nacionalidad" id="nacionalidadBrazilera">
      <label for="nacionalidadChilena">Chile </label>

      <input type="radio" name="nacionalidad" id="nacionalidadChilena">
      <label for="nacionalidadVenezolana">Venezuela </label>

      <input type="radio" name="nacionalidad" id="nacionalidadVenezolana">
      <label for="nacionalidadPerú">Perú </label>

      <input type="radio" name="nacionalidad" id="nacionalidadPerú">
      <label for="nacionalidadUruguay">Uruguay </label>

      <input type="radio" name="nacionalidad" id="nacionalidadUruguay">
      <label for="nacionalidadParaguay">Paraguay </label>

      <input type="radio" name="nacionalidad" id="nacionalidadParaguay">
    </fieldset>

    <button type="submit">Inscribirme</button>
  </form>
```

```js
//1. Captamos el formulario
const formulario = document.querySelector('form');
// alternativa captar formulario
// const form = document.forms[0];

// 4. Obtenemos la información de los nodos con el ID
const nombre = document.querySelector('#nombre');
const contrasenia = document.querySelector('#pass');
const telefono =  document.querySelector('#tel');
const hobbies =  document.querySelectorAll('#listado-hobbies input');
const nacionalidades = document.getElementsByName('nacionalidad');

//2. Prevenimos el envio del formulario por defecto y cuando de submit vamos a controlar todo lo que pasa
formulario.addEventListener('submit', function (event) {
    // 3. frenar el envío por defecto, para poder revisar todo antes.
    event.preventDefault();
    // 5. Captamos la información
    console.log(nombre.value);
    console.log(contrasenia.value);
    console.log(telefono.value);

    // 6. Vemos los nodos seleccionados con la propiedad `checked` y pusheamos a la lista
    let lista = [];
    hobbies.forEach( hobbie => {
        if(hobbie.checked){
            console.log(hobbie.id);
            lista.push(hobbie.id);
        }
    });
    // 7. Usamos checked para verificar cual fue la opcion del radio elegida y guardamos el dato en pais. 
    let pais;
    nacionalidades.forEach( radio =>{
        if(radio.checked){
            console.log(radio.id);
            pais = radio.id;
        }
    });
    //9. Mandamos los datos para verlos normalizados.
    console.log(normalizar(nombre.value, contrasenia.value, telefono.value, lista, pais));
    

});

//8. Creara un objeto con los datos normalizados.
function normalizar(nom, pass, tel, listadoHobbies, nacionalidad) {

    const datos = {
        //10. Pone en mayúscula la primera letra, con slice recorta el resto y lo pone en minúscula
        name: nom[0].toUpperCase() + nom.slice(1).toLowerCase(),
        password: pass,
        phone: tel,
        hobbies: listadoHobbies,
        nationality: nacionalidad
    }

    return datos;
}
```

## [⏪ Atrás](../README.md)