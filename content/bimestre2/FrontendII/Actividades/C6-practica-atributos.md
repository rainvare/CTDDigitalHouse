# C6 - Practica atributos

```js
let imagenes = [];

//para poner en el for la cantidad de imágenes que hay, por si agregamos mas imágenes después...
const nodosImg = document.querySelectorAll('.imagen');


//Ejercicio en Mesa ETAPA 2
const nodosA = document.querySelectorAll('a');
const nodoTarjeta = document.querySelectorAll('.tarjeta');


solicitarInfo();
//renderizarInfo();
renderMejorado();

function solicitarInfo() {
    //solicitamos urls para rellenar nuestro array
    for (let i = 0; i < nodosImg.length; i++) {
        const imagen = prompt("Ingrese la url de una imagen");
        imagenes.push(imagen);
    }
}

//rellenar los atributos SRC de las imágenes
function renderizarInfo() {
    for (let i = 0; i < imagenes.length; i++) {
        nodosImg[i].setAttribute('src', imagenes[i]);
        nodosImg[i].setAttribute('title', imagenes[i]);
        
        //Ejercicio en Mesa ETAPA 2
        nodosA[i].setAttribute('href', imagenes[i]);
        nodosA[i].setAttribute('target', "_blank");
    }
}

/* ETAPA 3
- Nodo padre: el <a></a> o "nodoA"
- Nodo hijo repetitivo: <img></img> o nodoImg
- Explicación: 

*/

function renderMejorado(){
    for (let i = 0; i < nodosImg.length; i++) {
        nodoTarjeta[i].innerHTML = `
        <a class=”rutas-img” target="_blank" href="${imagenes[i]}">
            <img src="${imagenes[i]}" class="imagen" alt="imagen-${i}" id="imagen-${i}"/>
        </a>`
    }
}
```

## [⏪ Atrás](../README.md)