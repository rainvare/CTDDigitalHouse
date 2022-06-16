window.addEventListener('load', function () {


    const apiUrl = 'https://dog.ceo/api/breeds/image/random';
    const nodoTarjeta = document.querySelector('.tarjeta');
    const boton = document.querySelector('#random');
    const imagen = document.querySelector('img');


    boton.addEventListener('click', function () {
        peticionFetch();
    });

    function peticionFetch() {
        boton.setAttribute('disabled','');

        fetch(apiUrl)
            .then(respuesta => {
                console.log("Respuesta del servidor");
                console.log(respuesta);
                return respuesta.json();
            }).then(data => {
                console.log(data);
                console.log(data.message);
                renderizar(data.message);
                boton.removeAttribute('disabled');        
            });
    }

    function renderizar(imagen) {
        nodoTarjeta.innerHTML = `<img src="${imagen}" alt="imagen perro">`
    }


})