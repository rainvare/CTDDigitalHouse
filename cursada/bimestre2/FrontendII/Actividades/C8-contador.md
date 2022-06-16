# C8 - Contador

en `HTML`

```html
    <div class="fila">
        <button id="btn-resta">Restar 1</button>
        <p id="numero">0</p>
        <button id="btn-suma">Sumar 1</button>
    </div>

    <div class="fila">
        <button id="btn-large"> Haga click aqui</button>
    </div>

    <div class="fila letras">
        <p>Letras tipeadas</p>
    </div>
```

En `script`

```js
//1: Contador inicia en 0
let contador = 0;

window.addEventListener("load",function(){
    //toda la logica interna de nuestro sitio
    const botonSuma = document.querySelector('#btn-suma');
    const botonResta = document.querySelector('#btn-resta');
    const btnLarge = document.querySelector('#btn-large');
    
    //3: Cuando se hace click en boton se ejecuta la funcion de sumarUno
    botonSuma.addEventListener('click', function() {
        sumarUno();
    });
    //7: Modo de ejemplo de poder poner muchos addEventListener del mismo selector sin pisar otro evento
    botonSuma.addEventListener('click', function() {
        console.log("sumó 1");
    });
    //5: Cuando hace click en resta, restaUno
    botonResta.addEventListener('click', function() {
        restarUno();
    });
    //6: Estudiamos el evento del click 
    btnLarge.addEventListener('click', function(event) {
        console.log(event);
        alert('hizo click')
    })
    //8: Aparecer la tecla tecleada en el html
    document.addEventListener('keypress', function(e) {
        console.log(e.key);
        const letras = document.querySelector('.letras');
        const parrafo = document.createElement('p');
        const texto = document.createTextNode(e.key);
        parrafo.appendChild(texto);
        letras.appendChild(parrafo);
    })
    //9: Ejemplo keydown que escucha teclas que no son caracteres como shift que pueden hacer acceder a comandos
    document.addEventListener('keydown',function(event){
        console.log(event.key);
    });

});

//2: Suma al contador y renderiza 
function sumarUno() {
    //sumatoria
    contador+=1;
    //renderizado
    const numero = document.querySelector('#numero');
    numero.innerText = contador;
}
//4. Incorporamos la resta
function restarUno() {
    //sumatoria
    contador-=1;
    //renderizado
    const numero = document.querySelector('#numero');
    numero.innerText = contador;
}
```

## [⏪ Atrás](../README.md)