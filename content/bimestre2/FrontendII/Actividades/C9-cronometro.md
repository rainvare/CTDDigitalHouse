# C9 - Cronometro

```html
<main>
    <h2>Cronómetro</h2>
    <p id="valor">0</p>
    <button id="iniciar">▶ Iniciar</button>
    <button id="pausa">⏸ Pausa</button>
    <button id="stop">⏹ Stop</button>
    <button id="acelerar">x2</button>
</main>
```

```js
window.addEventListener('load', function () {

    //1: inicializa en 0
    let contador = 0;
    //11. seteo el tiempo del intervalo del cronometro
    let tiempo = 1000;

    //2. El numero que va a cambiar
    const valor = this.document.querySelector('#valor');
    //3. El boton que va a iniciar el cronometro
    const btnIniciar = document.querySelector('#iniciar');
    const btnStop = document.querySelector('#stop');
    const btnPausa = document.querySelector('#pausa');

    let cronometro;
    //5. Aqui escucha el evento click y llama a play
    btnIniciar.addEventListener('click', function () {
        play();
    });
    //8. Aqui escucha el evento click y llama a reiniciar
    btnStop.addEventListener('click', function () {
        reiniciar();
    })
    //10. Aqui escucha el evento click y llama a pausar
    btnPausa.addEventListener('click', pausar)

    //4. definimos la funcion de comenzar el cronometro, cuando le damos a play se inicia el intervalo
    function play() {
        cronometro = setInterval(function () {
            contador++;
            console.log(contador);
            renderizar();
        }, tiempo);
        //desactiva volver a iniciar al mismo tiempo otro cronometro
        btnIniciar.setAttribute('disabled',"")
    }

    //6. definimos la funcion de renderizado, va a mostrar el valor del contador
    function renderizar() {
        valor.innerText = contador;
    }

    //7. definir funcion para frenar y reiniciar el cronometro
    function reiniciar() {
        clearInterval(cronometro);
        contador = 0;
        renderizar();
        //deja a activado el boton 
        btnIniciar.removeAttribute('disabled');
    }
    
    // 9. definir la funcionalidad de pausa
    function pausar() {
        //frena el intervalo y lo limpia
        clearInterval(cronometro);
        console.log(cronometro);
        //deja a activado el boton 
        btnIniciar.removeAttribute('disabled');
    }

});
```