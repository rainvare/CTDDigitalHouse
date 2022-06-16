# C9 - Cronometro con aceleración

```js
window.addEventListener("load", function () {

  let contador = 0;
  let tiempo = 1000;

  const valor = this.document.querySelector("#valor");
  const btnIniciar = document.querySelector("#iniciar");
  const btnStop = document.querySelector("#stop");
  const btnPausa = document.querySelector("#pausa");
  const btnAcelerar = document.querySelector("#acelerar");

  let cronometro;
  let aceleracion = 2;

  btnIniciar.addEventListener("click", function () {
    play();
  });
  btnStop.addEventListener("click", function () {
    reiniciar();
  });
  btnPausa.addEventListener("click", pausar);
  btnAcelerar.addEventListener("click", acelerar);

  //definimos la funcion de comenzar el cronometro
  function play() {
    cronometro = setInterval(function () {
      contador++;
      console.log(contador);
      renderizar();
    }, tiempo);
    btnIniciar.setAttribute("disabled", "");
  }

  //definimos la funcion de renderizado
  function renderizar() {
    valor.innerText = contador;
  }

  //definir funcion para frenar y reiniciar el cronometro
  function reiniciar() {
    tiempo = 1000;
    clearInterval(cronometro);
    contador = 0;
    aceleracion = 2;
    renderizar();
    pintarx2();
    btnIniciar.removeAttribute("disabled");
  }

  // definir la funcionalidad de pausa
  function pausar() {
    clearInterval(cronometro);
    console.log(cronometro);
    btnIniciar.removeAttribute("disabled");
  }

  // definir la funcion de acelerar
  // - va a duplicar la velocidad
  // - se puede seguir duplicando
  // - deberia verse el texto del boton con el valor multiplicado
  function acelerar() {
    aceleracion *= 2;
    tiempo = tiempo / 2;
    pausar();
    play();
    pintarx2();
  }
  // 2 4 8 16 32
  function pintarx2() {
    btnAcelerar.innerText = `x${aceleracion}`;
  }
});
```