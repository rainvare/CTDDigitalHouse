console.log("Banca Mobile");
const cartelBanco = document.querySelector('.bancaMobile');
const btnConsultar = document.querySelector('button');

btnConsultar.addEventListener('click', function () {

    // mostramos la nueva UI
    cartelBanco.classList.remove('oculto');

    /* -------------------------------------------------------------------------- */
    /*                     simulamos un servidor respondiendo                     */
    /* -------------------------------------------------------------------------- */
    const promesaBanco = new Promise((resolve, reject) => {

        // simulamos info en una base de datos
        const cuenta = {
            nombre: "Michael Scott",
            estadoActivo: false,
            fondos: 1500
        };

        setTimeout(function () {

            if (cuenta.estadoActivo != true) {
                reject({
                    mensaje: "Cuenta inactiva, petición rechazada.",
                    estatus: "x450"
                })
            } else if (cuenta.fondos < 100) {
                reject({
                    mensaje: "Fondos insuficientes.",
                    estatus: "z420"
                })
            } else {
                resolve({
                    mensaje: "Pago realizado con éxito",
                    estatus: "c200"
                })
            }

        }, 5500)

    });

    /* -------------------------------------------------------------------------- */
    /*                 trabajamos con el resultado de una promesa                 */
    /* -------------------------------------------------------------------------- */

    promesaBanco.then(respuesta => {
        console.log("Respuesta resuelta:");
        console.log(respuesta);
        cartelBanco.innerHTML = `<h5>${respuesta.mensaje}</h5>`;
        cartelBanco.style.border = "3px solid green";
    }).catch(error => {
        console.log("Respuesta rechazada");
        console.log(error);
        cartelBanco.innerHTML = `<h5>${error.mensaje}</h5>`;
        cartelBanco.style.border = "3px solid red";
    });

});