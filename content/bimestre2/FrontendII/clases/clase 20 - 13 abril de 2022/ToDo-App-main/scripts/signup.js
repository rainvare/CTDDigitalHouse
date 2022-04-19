window.addEventListener('load', function () { //se carga el DOM
    /* ---------------------- obtenemos variables globales ---------------------- */
    const formulario = document.forms[0]; // se optiene el formulario

    //se obtienen los nodos del documento
    const nombre = document.querySelector('#inputNombre');
    const apellido = document.querySelector('#inputApellido');
    const email = document.querySelector('#inputEmail');
    const password = document.querySelector('#inputPassword');
   // const passwordRepetida = document.querySelector('#inputPasswordRepetida');
    const APIurl = 'https://ctd-todo-api.herokuapp.com/v1'; // url de la API a consultar

    /* -------------------------------------------------------------------------- */
    /*            FUNCIÓN 1: Escuchamos el submit y preparamos el envío           */
    /* -------------------------------------------------------------------------- */
   
    formulario.addEventListener('submit', function (event) { // capturar el evento submit
        event.preventDefault(); // prevenir que se envíe el formulario
        
        //creamos el cuerpo de la petición o request para preparar la data que vamos a mandar en la solicitud
        const usuario = {
            firstName: nombre.value,
            lastName: apellido.value, 
            email: email.value,
            password: password.value
        };
        //configuramos la request del Fetch para que se adapte al formato de la API
        const configuraciones = {
            method: 'POST',
            body: JSON.stringify(usuario),
            headers: {
                'Content-Type': 'application/json'
            }
        };
        //lanzamos la consulta de login a la API 
        realizarRegister(configuraciones);

        //limpio los campos del formulario
        form.reset();
    });

    /* -------------------------------------------------------------------------- */
    /*                    FUNCIÓN 2: Realizar el signup [POST]                    */
    /* -------------------------------------------------------------------------- */
    function realizarRegister(configuraciones) {
        console.log("Consulta a la API");
        fetch(`${APIurl}/users`, configuraciones) // se pasan dos métodos en el fetch para definir un cuerpo de la respuesta ( 'template literals'/endpoints)
            .then(respuesta => { //arrow function para captura respuesta 
                console.log(respuesta);

                if (respuesta.ok != true) {
                    alert("Alguno de los datos es incorrecto.")
                }

                return respuesta.json();

            })
            .then(data => {
                console.log("Promesa cumplida:");
                console.log(data);

                if (data.jwt) {// llegada del token
                    //guardo el objeto con el token en LocalStorage 
                    localStorage.setItem('jwt', JSON.stringify(data.jwt));

                    //redireccionamos a la página
                    location.replace('/mis-tareas.html');
                }
                
            }).catch(err => {
                console.log("Promesa rechazada:");
                console.log(err);
            })
    };


});
