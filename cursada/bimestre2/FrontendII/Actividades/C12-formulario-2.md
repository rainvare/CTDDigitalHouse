# C12 - Formulario Hogwarts - Normalización 

En el `HTML`

```html
<form>
    <h1>Inscripcion a Hogwarts</h1>
    <label for="nombre">Nombre completo:</label>
    <input type="text" class="" name="nombre" id="nombre" autocomplete="off">
    <!-- agregamos para mostrar el error -->
    <small id="mensajeNombre" class="oculto">Solo caracteres válidos, mínimo 3 y máximo 20.</small>

    <label for="pass">Contraseña:</label>
    <input type="password" name="pass" id="pass">
    <label for="tel">Telefono:</label>
    <input type="text" name="tel" id="tel">

    <fieldset class="" id="listado-hobbies">
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
        <input type="checkbox" name="hobbies" id="hobbiesProgramacion">

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
const formulario = document.querySelector('form');

const nombre = document.querySelector('#nombre');
const contrasenia = document.querySelector('#pass');
const telefono =  document.querySelector('#tel');
const hobbies =  document.querySelectorAll('#listado-hobbies input');
const nacionalidades = document.getElementsByName('nacionalidad');
// 9. Captamos el nodo del mensaje de error
const mensajeNombre = document.querySelector('#mensajeNombre');
// 13. Captamos selector de campos de hobbies para resaltar el error
const fielsetHobbies =  document.querySelector('#listado-hobbies');

// 5. evento se dispara cuando se da click en enviar
formulario.addEventListener('submit', function (event) {
 
    event.preventDefault();
    console.log(nombre.value);
    console.log(contrasenia.value);
    console.log(telefono.value);

    let lista = [];
    hobbies.forEach( hobbie => {
        if(hobbie.checked){
            console.log(hobbie.id);
            lista.push(hobbie.id);
        }
    });

    let pais;
    nacionalidades.forEach( radio =>{
        if(radio.checked){
            console.log(radio.id);
            pais = radio.id;
        }
    });


    // 6. Validamos el nombre, si esto no es true, entonces muestra error
    if(!validarNombre(nombre.value)){
        // 7. Implementamos la clase de error para mostrar el error, usamos add para controlar el error, no toggle porque puede haber errores.
        nombre.classList.add('error');
        // 10. Removemos la clase oculto para que se pueda mostrar el mensaje de error
        mensajeNombre.classList.remove('oculto');
    }else{
        // 8. En los casos que no sea false, sacamos el error
        nombre.classList.remove('error');
        // 11. Cuando no hay mas error, se oculta el mensaje de error
        mensajeNombre.classList.add('oculto');
    }

    // 12. Validamos la cantidad de hobbies, no deben haber mas de 4 hobbies, se agrega y se desagrega el resaltado del error
    if(lista.length > 4){
        fielsetHobbies.classList.add('incorrecto');
    }else{
        fielsetHobbies.classList.remove('incorrecto');
    }

    // normalizamos
    console.log(normalizar(nombre.value, contrasenia.value, telefono.value, lista, pais));
    

});

function normalizar(nom, pass, tel, listadoHobbies, nacionalidad) {
    const datos = {
        name: nom[0].toUpperCase() + nom.slice(1).toLowerCase(),
        password: pass,
        phone: tel,
        hobbies: listadoHobbies,
        nationality: nacionalidad
    }
    return datos;
}

//1. creamos funcion para validar nombre.
function validarNombre(nombre) {
    //Lo que viene es verdadero, si no, sera falso.
    let resultado = true;

    // 2. validamos que sea un texto sin caracteres especiales o números.
    let carcateresInvalidos = ["0","1","2","3","4","5","6","7","8","9",".","-","_"]
    
    // 3. Compara el array con caracteres especiales con el elemento que es nombre.
    carcateresInvalidos.forEach( elemento => {
        if(nombre.includes(elemento)){
            resultado = false;
        }
    });

    // 4. Van mínimo 3 caracteres y máximo 20 caracteres
    if(nombre.length < 3 || nombre.length >20){
        resultado = false;
    }

    return resultado;
}
```

## [⏪ Atrás](../README.md)