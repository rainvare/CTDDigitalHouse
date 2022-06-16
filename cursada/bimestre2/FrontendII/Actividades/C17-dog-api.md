# C17 - Dog API

```html
<main>
    <button id="random">Solicitar API</button>
    <div class="tarjeta">
        
    </div>
</main>
```

```js
// 1. Endpoint de imágenes random de perritos
const apiUrl = 'https://dog.ceo/api/breeds/image/random';
// 9. Capto nodo imagen
const imgDog = document.querySelector('.tarjeta  img');
// 13. Capto nodo tarjeta donde renderizare la imagen, asi no sale una img rota
const nodoTarjeta =  document.querySelector('.tarjeta');
const boton =  document.querySelector('#random');

// 10. Escuchamos click del botón 
boton.addEventListener('click', function(){
    peticionFetch();
})

// 12. Meto el pedido en una funcion de petición Fetch 
function peticionFetch() {
    // 14. Mientras resuelve, deshabilitamos el botón para que no pueda ser clickeado mientras consulta la API
    boton.setAttribute('disabled','');

    // 2. Iniciamos la comunicación con el servidor de la API a traves de la interfaz Fetch, que devuelve una promesa; hacemos una petición a esa url
    fetch(apiUrl)
    // 3. Capta la respuesta con then y hacemos algo con la respuesta positiva
    .then( res => {
        // 4. Imprime la respuesta en consola.
        console.log(res);
        // 5. Saca la información que necesitamos en formato JSON, esto devuelve otra promesa, que se la pasamos al otro then (abajo) con el return.
        return res.json();
        // 6. Aquí llega la data del res.json y podemos usar la info, en formato js; un objeto literal.
    }).then( data => {
        // 7. Muestro la info en consola.
        console.log(data);
        // 8. Accedo a una propiedad del objeto de data.
        console.log(data.message);
        renderizar(data.message);
        // 15. Habilita el botón cuando renderiza la imagen
        boton.removeAttribute('disabled');
        
        // 16. Implementamos el catch para captar el error.
    }).catch( error => {
        // 17. Mostramos el error en consola
        console.log(error);
        // 19. Ejecuta el renderizado del error
        mostrarError();
    })

}

// 11. Recibe una imagen y la renderiza
function renderizar(imagen) {
    nodoTarjeta.innerHTML = `<img src="${imagen}" alt="imagen de un perro">`
}
// 18. Renderiza el error
function mostrarError() {
    nodoTarjeta.innerHTML = `<p>Hubo algun error en la petición.</p>`
}
```

## [⏪ Atrás](../README.md)