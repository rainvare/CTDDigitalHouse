# C7 - Cambio tema dinamico

```js
function cambiarTema() {
  const oscuro = document.body.classList.toggle('dark');

  const boton = document.querySelector('.theme button');

  if (oscuro) {
    boton.innerText = "Cambiar tema 🌞";
  } else {
    boton.innerText = "Cambiar tema 🌛";
  }
};
```

## [⏪ Atrás](../README.md)