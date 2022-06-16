function llamarAPI(){
    fetch('https://randomuser.me/api/')
    .then(response => {
        console.log(response);
        return response.json();
    })
    .then(data => {
       const info=data.results[0];
       console.log(info)
       renderizarDatosUsuario(info)
    })
    .catch(err => {
        alert("Error de conexión con la API \n" + err);
    });

}


function renderizarDatosUsuario(datos) {
    /* -------------------------------- CONSIGNA 1 -------------------------------- */
    // Aquí deben desarrollar una función que muestre en pantalla:
    // la foto, el nombre completo del usuario y su email.
    // Esto debe estar basado en la info que nos llega desde la API e insertarse en el HTML.
   let tarjeta=document.querySelector(".tarjeta");
   tarjeta.innerHTML=`<img src="${datos.picture.large}">
                    <p>${datos.name.first} ${datos.name.last}</p>
                    <p>${datos.email}</p>`
}


/* --------------------------- CONSIGNA 2 (extra) --------------------------- */
// Aqui pueden ir por el punto extra de utilizar el boton que se encuentra comentado en el HTML
// Pueden descomentar el código del index.html y usar ese boton para ejecutar un nuevo pedido a la API, sin necesidad de recargar la página.
// Es criterio del equipo QUÉ bloque del código debe contenerse dentro de una función para poder ser ejecutada cada vez que se escuche un click.


let boton=document.querySelector("button");
boton.addEventListener("click",()=>{
    llamarAPI();
})
