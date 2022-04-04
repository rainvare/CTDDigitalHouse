# C16 - Simulación de asincronía

Simulamos que pedimos información bancaria.


```html
<main>
    <div class="bancaMobile">
        <h5>Estamos consultando tus datos...</h5>
    </div>
</main>
```

```js
console.log("Banco digital");
const cartelRespuesta = document.querySelector('.bancaMobile');

// Simulación de un proceso asincrónico de un servidor

// 1. Estamos simulando una petición a un servidor
// 2. Simulamos el pedido y el tiempo de espera, pide dos paremetros resolución y rechazo (resolve, reject)
const promesa = new Promise((resolve, reject) => {

    // 3. Simulo info almacenada en la DB de un servidor
    let usuario = {
        estadoCuenta: "inactiva",
        nombre: "Michael Scott",
        fondos: 1500
    }
    // 4. Simulamos el tiempo y posibles casos/respuestas de un servidor, correctas e incorrectas
    setTimeout(function () {
        if(usuario.estadoCuenta == "inactiva"){
            //
            reject({
                mensaje: "Resultado rechazado. Cuenta inactiva.",
                estatus: "215"
            })
        } else if(usuario.fondos < 100){
            reject({
                mensaje: "Fondos insuficientes",
                estatus: "240"
            })
        }else{
            // Resolución de promesa, respuesta positiva
            resolve({
                mensaje: "Pago realizado con éxito",
                fondos: usuario.fondos,
                estatus: "200"
            })
        }
      
    }, 4000);

});

console.log(promesa);
console.log("esperando respuesta del banco...");

// Estructura que reutilizamos para el consumo de APIs 

// 5. Trabajamos la resolución de la promesa, la respuesta es positiva porque se resolvio
promesa.then(respuesta => {
    // 6. Hacemos algo con la respuesta positiva
    console.log(respuesta);
    cartelRespuesta.innerHTML = `<p>${respuesta.mensaje}</p>`;
    cartelRespuesta.style.border = "3px solid green";

    // 7. Captamos el rechazo o el error
}).catch(error => {
    // 8. Hacemos algo con la respuesta negativa
    console.log(error);
    cartelRespuesta.innerHTML = `<p>${error.mensaje}</p>`;
    cartelRespuesta.style.border = "3px solid red";
});
```
