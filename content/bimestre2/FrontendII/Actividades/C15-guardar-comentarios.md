# C15 - Guarda comentarios

```html
<main>
    <div class="contenedor">
        <form>
            <label for="comentario">Comentario</label>
            <input type="text" id="comentario">
            <button type="submit">COMENTAR</button>
        </form>
    </div>
    <div class="comentarios">
        
    </div>
</main>
```

```js
window.addEventListener('load', function () {
    // 1. Guardamos referencia de los nodos importantes
    const form = document.forms[0];
    const inputComentario = document.querySelector('#comentario');
    const cajaComentarios = document.querySelector('.comentarios');

    // 3. Guardamos en un array el listad de comentarios
    let listadoComentarios = [];

    // 5. Chequeo si ya existe algo en storage
    let comentariosEnDeposito = JSON.parse(localStorage.getItem('comentariosEnStorage'));
    // 6. Si hay comentarios en storage, los agrego al listado
    if(comentariosEnDeposito != null){
        // si había algo guardado, se lo asigno a mi array en memoria
        listadoComentarios = comentariosEnDeposito;
        // Si había comentarios, los renderiza
        renderizarComentarios(listadoComentarios);
    }

    // 2. Utilizamos el submit para lanzar cierto accionar
    form.addEventListener('submit', function (event) {
        event.preventDefault();
        // Guarda comentario del input.value
        guardarComentario(inputComentario.value);
        // Renderiza los comentarios del listado.
        renderizarComentarios(listadoComentarios);

        form.reset();
    });
    // 3. Creamos funcion encargada de guardar
    function guardarComentario(comentario) {
        // Pushea en el array del listado, el comentario
        listadoComentarios.push(comentario);
        // Agrego la funcionalidad para perdurar en localStorage
        localStorage.setItem('comentariosEnStorage', JSON.stringify(listadoComentarios));
    }
    // 4. Creamos funcion que renderiza comentarios, espera el array de listado.
    function renderizarComentarios(listado) {
        // limpia la caja de comentarios
        cajaComentarios.innerHTML = "";
        listado.forEach(item => {
            cajaComentarios.innerHTML += `<p>${item}</p>`;
            // let texto = document.createTextNode(item);
            // let parrafo = document.createElement('p');
            // parrafo.appendChild(texto);
            // cajaComentarios.appendChild(parrafo);
        });
    }

})

```

## [⏪ Atrás](../README.md)