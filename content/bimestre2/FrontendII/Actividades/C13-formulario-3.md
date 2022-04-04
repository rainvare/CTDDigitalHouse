# C13 - Formulario Hogwarts - Validaciones

```html
<form>
    <h1>Inscripcion a Hogwarts</h1>
    <label for="nombre">Nombre completo:</label>
    <input type="text" class="" name="nombre" id="nombre" autocomplete="off">
    <small id="mensajeNombre" class="oculto">Solo caracteres válidos, mínimo 3 y máximo 20.</small>

    <label for="pass">Contraseña:</label>
    <input type="password" name="pass" id="pass">

    <label for="tel">Telefono:</label>
    <input type="text" name="tel" id="tel">
    <!-- Agregamos el mensaje de error del telefono -->
    <small id="mensajeTelefono" class="oculto">Solo ingrese numeros, mínimo 7 y máximo 11.</small>

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

    <button type="submit" disabled>Inscribirme</button>
</form>
```

```js
const formulario = document.querySelector('form');
// 20. Captamos el botón submit para habilitarlo o deshabilitarlo
const botonSubmit = document.querySelector('form button');

const nombre = document.querySelector('#nombre');
const contrasenia = document.querySelector('#pass');
const telefono =  document.querySelector('#tel');
const hobbies =  document.querySelectorAll('#listado-hobbies input');
const nacionalidades = document.getElementsByName('nacionalidad');
const mensajeNombre = document.querySelector('#mensajeNombre');
const fielsetHobbies =  document.querySelector('#listado-hobbies');
const mensajeTelefono =  document.querySelector('#mensajeTelefono');

// 15. Creamos objeto para chequear constantemente las validaciones, guardamos cada cambio en el objeto y hacemos la validación general desde el objeto, el botón submit se habilitara si el objeto esta correcto.

const datosUsuario = {
    nombre: "",
    contrasenia: "",
    telefono: "",
    hobbies: [],
    nacionalidad: ""
};

// 13. Validación de datos cuando salga el foco del campo    
nombre.addEventListener('blur', function(evento){
    // 16. Cada vez que salga del blur se llena la propiedad nombre del objeto datosUsuario
    datosUsuario.nombre = nombre.value;
    console.log(datosUsuario);

    if(!validarNombre(nombre.value)){
        nombre.classList.add('error');
        mensajeNombre.classList.remove('oculto');
    }else{
        nombre.classList.remove('error'); 
        mensajeNombre.classList.add('oculto');
    }
});

// 14. Validación de datos cuando salga el foco del campo    
telefono.addEventListener('blur', function() {
    // 17. Cada vez que salga del blur se llena la propiedad telefono del objeto datosUsuario
    datosUsuario.telefono = telefono.value;
    console.log(datosUsuario);

    if(!validarTelefono(telefono.value)){
        // 9. Implementamos la clase de error para mostrar el error, usamos add para controlar el error, no toggle porque puede haber errores.
        telefono.classList.add('error');
        // 10. Removemos la clase oculto para que se pueda mostrar el mensaje de error
        mensajeTelefono.classList.remove('oculto');
    }else{
        // 11. En los casos que no sea false, sacamos el error
        telefono.classList.remove('error');
        // 12. Cuando no hay mas error, se oculta el mensaje de error
        mensajeTelefono.classList.add('oculto');
    }
});

// 18. Habilitando el botón para el submit.
formulario.addEventListener('change', function () {
    console.log("CAMBIO EL FORMULARIO")
    // 19. Pregunto si lo datos del objeto son correctos
    // Si son correctos habilito el botón submit
    // Si son incorrectos mantengo el botón submit deshabilitado
    if(validarNombre(datosUsuario.nombre) && validarTelefono(datosUsuario.telefono)){
        // 21. si se da la condición anterior, se habilita el botón submit
        botonSubmit.removeAttribute('disabled');
    }
    
})

formulario.addEventListener('submit', function (event) {
    // frenar el envío por defecto
    event.preventDefault();

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

        
//-------------- validamos la cantidad de hobbies 

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

function validarNombre(nombre) {
    let resultado = true;
    let carcateresInvalidos = ["0","1","2","3","4","5","6","7","8","9",".","-"]
    
    // Validación de nombre: 1
    carcateresInvalidos.forEach( elemento => {
        if(nombre.includes(elemento)){
            resultado = false;
        }
    });

    //Validación de nombre: 2
    // 5. Pasamos datos a funcion que valida min y max
    if(!validarMinimoMaximo(3,20,nombre)){
        resultado = false;
    }

    return resultado;
}

// 1. Validar telefono
function validarTelefono(telefono) {
    let resultado = true;

    // Validación telefono: 1
    // 2. Usando funcion validad min y max, le mandamos Mínimo 7 números, máximo 11 
    if(!validarMinimoMaximo(7,11,telefono)){
        resultado = false;
    }

    // Validación telefono: 2
    // 6. Validar que sean solo números
    if(!validarSoloNumero(telefono)){
        resultado =  false;
    }

    return resultado;
}

// 3. Responsabilidad de validar mínimo permitido y máximo permitido, para el tel y el texto.
function validarMinimoMaximo(min, max, dato) {
    let resultado = true;
    // 4. Si se cumple esta condición, esta fuera del rango permitido.
    if(dato.length < min || dato.length > max){
        resultado = false;
    }
    return resultado;
}

// 7. Creamos funcion que valide que sean solo números.
function validarSoloNumero(dato) {
    let resultado = true;
    //8. Solo con isNaN me va a validar si no es un numero
    if(isNaN(dato)){
        resultado = false;
    }

    return resultado;
}
```

## [⏪ Atrás](../README.md)