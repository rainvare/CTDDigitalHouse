# C14 - Buscador 

En `HTML`

```html
<header class="super-center">
    <h1>🔍 Buscador 3.0 DH</h1>
</header>

<main class="super-center">
    <form class="search">
        <label for="busqueda">Buscar en la web</label>
        <input id="busqueda" type="text" placeholder="Realizar una búsqueda">
        <button type="submit">Buscar</button>
        <button id="delete" type="button">Borrar Historial</button>
    </form>

    <h3>Historial</h3>
    <div id="busquedas-realizadas">
        
    </div>
</main>
```

```js
const formulario =  document.forms[0];
const inputBusqueda =  document.querySelector('#busqueda');
const cajaBusquedas = document.querySelector('#busquedas-realizadas');
const botonDelete =  document.querySelector('#delete');

// 3. creamos un listado vacio
const historial = [];

// 4. Preguntar si hay algo en el historial(en el deposito)
const historialLocalStorage = JSON.parse(localStorage.getItem('busquedasRealizadas'));

// 5. Si existe algo previamente lo guardamos en nuestro array
if(historialLocalStorage){
    historialLocalStorage.forEach( item => {
        historial.push(item);
    })
}

renderizarBusquedas();

formulario.addEventListener('submit', function(event){
    event.preventDefault();
    guardarNuevaBusqueda(inputBusqueda.value)
    busquedaGoogle(inputBusqueda.value);
    //Esto limpia el formulario antes de mandarlo a algun lado
    formulario.reset();    
});

// 8. Evento que llama a borrar historial
botonDelete.addEventListener('click', borrarHistorial);


// 1. Funcion de busqueda en Google, 
function busquedaGoogle(criterio) {
    location.href = `https://www.google.com/search?q=${criterio}`
}

// 2. funcion para renderizar las busquedas en pantalla
function renderizarBusquedas() {
    let buscados = JSON.parse(localStorage.getItem('busquedasRealizadas'));
    //Si hay busquedas en localStorage las renderiza, si no, no.
    if(buscados){
        // Por cada elemento lo imprime en pantalla
        buscados.forEach(  item => {
            cajaBusquedas.innerHTML += `<p>${item}</p>`;
        });
    }else{
        cajaBusquedas.innerHTML="";
    }
}

// 6. Funcion para guardar nuevas busquedas
function guardarNuevaBusqueda(buscado) {
    //lo agregamos al listado
    historial.push(buscado);
    //actualizamos el local storage
    localStorage.setItem('busquedasRealizadas', JSON.stringify(historial));
}

// 7. Funcion para limpiar el localStorage y la caja de busquedas
function borrarHistorial() {
    // Limpia el localStorage
    localStorage.clear();
    renderizarBusquedas();
}
```