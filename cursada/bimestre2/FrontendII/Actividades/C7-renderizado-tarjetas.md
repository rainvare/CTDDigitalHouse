# C7 - Renderizado tarjetas

```html
<div class="contenedor">
    
</div>
```

version `forEach()`
```js
function renderizarTarjetas(data) {
  const contenedor = document.querySelector('.contenedor');
  //replicamos las tarjetas en el contenedor

  data.forEach(item => {
    contenedor.innerHTML += `<div class="item">
                              <img src="${item.imgUrl}">
                              <h2>${item.title}</h2>
                              <p>
                               ${item.description}
                              </p>
                            </div>`;
  });
}

renderizarTarjetas(listadoFelinos);
```

Version `for`

```js

function renderizarTarjetas(data) {
  const contenedor = document.querySelector('.contenedor');
  //replicamos las tarjetas en el contene

    for(let i = 0; i< data.length; i++) {
     contenedor.innerHTML += `<div class="item">
     <img src="${data[i].imgUrl}">
     <h2>${data[i].title}</h2>
     <p>
      ${data[i].description}
     </p>
   </div>`
    }
}

console.log(listadoFelinos);
renderizarTarjetas(listadoFelinos);
```

## [⏪ Atrás](../README.md)