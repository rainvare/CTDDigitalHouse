# C15 - To Do 

`login.js`

```js
/* -------------------------------------------------------------------------- */
/*                   logica aplicada en la pantalla de LOGIN                  */
/* -------------------------------------------------------------------------- */
const apiUrl = 'https://ctd-todo-api.herokuapp.com/v1/users/login';

window.addEventListener('load', function(){

    const formulario =  this.document.forms[0];
    const inputEmail = this.document.querySelector('#inputEmail');
    const inputPassword =  this.document.querySelector('#inputPassword');


    formulario.addEventListener('submit', function(event){
        event.preventDefault();

        const validacion = validacionNoVacio(inputEmail.value) && validacionNoVacio(inputPassword.value);

        if(validacion){
            //en caso de que esté todo correcto, iniciamos la peticion
            const datosUsuario = normalizacionLogin(inputEmail.value, inputPassword.value);
            console.log(datosUsuario);
            //consultamos al servidor y esperamos su respuesta
            fetchApiLogin(apiUrl, datosUsuario);
        }else{
            console.log("algun dato no es correcto");
        }

        formulario.reset();
    });

});

/* -------------------------------------------------------------------------- */
/*                      seccion de funciones disponibles                      */
/* -------------------------------------------------------------------------- */

function validacionNoVacio(texto) {
    let resultado = true;

    if(texto === ""){
        resultado = false;
    }

    return resultado
}

function normalizacionLogin(email, password) {
    const usuario = {
        email: email.toLowerCase().trim(),
        password: password.trim()
    }
    
    return usuario;
}

function fetchApiLogin(url,payload) {

    const configuraciones = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(payload)
    }
    
    fetch(url, configuraciones)
    .then( respuesta => {
        console.log(respuesta);
        return respuesta.json()
    })
    .then( data => {
        console.log(data);
        console.log(data.jwt);
        //si llega correctamente un token
        if(data.jwt){
            localStorage.setItem('jwt', data.jwt);

            location.href = '/mis-tareas.html'
        }
    })
}
```

`tasks.js`

```js
// chequear que exista un usuario loggeado
const jwt = localStorage.getItem('jwt');
// si no existe un token, lo sacamos de la vista
if(!jwt){
    location.replace('/');
}


const apiBaseUrl = 'https://ctd-todo-api.herokuapp.com/v1';

window.addEventListener('load', function () {
    /* -------------------------------------------------------------------------- */
    /*                             logica de la vista                             */
    /* -------------------------------------------------------------------------- */
    const jwt = localStorage.getItem('jwt')

    const nodoNombreUsuario = document.querySelector('.user-info p');
    const nodoFormulario = document.querySelector('.nueva-tarea');
    const inputNuevaTarea = document.querySelector('#nuevaTarea');
    const btnCerrar = document.querySelector('#closeApp');

    btnCerrar.addEventListener('click', function() {
        // cerra sesion
        if(confirm("¿Desea cerrar sesión?")){
            // limpiamos el storage y redireccionamos
            localStorage.clear();
            location.replace('/');
        }
    })

    /* --------------- funciones que se disparan al iniciar la app -------------- */
    obtenerNombreUsuario(`${apiBaseUrl}/users/getMe`, jwt);
    obtenerListadoTareas(`${apiBaseUrl}/tasks`, jwt);

    /* ----------------- accionar que dispara el submit del form ---------------- */
    nodoFormulario.addEventListener('submit', function (evento) {
        evento.preventDefault();
        
        const nuevaTarea = {
            description: inputNuevaTarea.value,
            completed: false
        }

        crearNuevaTarea(`${apiBaseUrl}/tasks`, jwt, nuevaTarea );


        nodoFormulario.reset();
    });


    /* -------------------------------------------------------------------------- */
    /*                                  funciones                                 */
    /* -------------------------------------------------------------------------- */

    /* ------------------------- funcion de renderizado ------------------------- */
    function renderizarListaTareas(listado) {
        const nodoTareasTerminadas = document.querySelector('.tareas-terminadas');
        const nodoTareasPendientes = document.querySelector('.tareas-pendientes');

        nodoTareasPendientes.innerHTML = "";
        nodoTareasTerminadas.innerHTML = "";

        listado.forEach( tarea => {
            // si la tareas está terminada
            if(tarea.completed){
                nodoTareasTerminadas.innerHTML += `
                <li class="tarea">
                    <div class="done"></div>
                    <div class="descripcion">
                        <p class="nombre">${tarea.description}</p>
                        <div>
                        <button><i id="${tarea.id}" class="fas
                        fa-undo-alt change"></i></button>
                        <button><i id="${tarea.id}" class="far
                        fa-trash-alt"></i></button>
                    </div>
                    </div>
                </li>
                `
            } else {
                nodoTareasPendientes.innerHTML += `
                <li class="tarea">
                    <div class="not-done change" id="${tarea.id}"></div>
                    <div class="descripcion">
                        <p class="nombre">${tarea.description}</p>
                        <p class="timestamp"><i class="far
                        fa-calendar-alt"></i> ${tarea.createdAt}</p>
                    </div>
                </li>
                `
            }
        })

        // procedemos a habilitar el cambio de estado
        botonCambioEstado();
        // procedemos a habilitar el borrado de una tarea terminada
        botonBorrarTarea();
    }

    /* ---------------------- PUT: cambiar estado de tareas --------------------- */

    
  function botonCambioEstado() {
    const btnCambioEstado = document.querySelectorAll('.change');

    btnCambioEstado.forEach(boton => {
      //a cada boton le asignamos una funcionalidad
      boton.addEventListener('click', function (event) {
        const id = event.target.id;
        const url = `${apiBaseUrl}/tasks/${id}`
        const payload = {};

        //segun el tipo de boton que fue clickeado, cambiamos el estado de la tarea
        if (event.target.classList.contains('fa-undo-alt')) {
          payload.completed = false;
        } else {
          payload.completed = true;
        }

        const settingsCambio = {
          method: 'PUT',
          headers: {
            "Authorization": jwt,
            "Content-type": "application/json"
          },
          body: JSON.stringify(payload)
        }
        fetch(url, settingsCambio)
          .then(response => {
            console.log(response.status);
            //obtener y renderizar nuevamente las tareas
            obtenerListadoTareas(`${apiBaseUrl}/tasks`, jwt);
          })
      })
    });

  }

  /* --------------------------- DELTE: borrar tarea -------------------------- */
  function botonBorrarTarea() {
    //obtenemos los botones de borrado
    const btnBorrarTarea = document.querySelectorAll('.fa-trash-alt');

    btnBorrarTarea.forEach(boton => {
      //a cada boton de borrado le asignamos la funcionalidad
      boton.addEventListener('click', function (event) {
        const id = event.target.id;
        const url = `${apiBaseUrl}/tasks/${id}`

        const settingsCambio = {
          method: 'DELETE',
          headers: {
            "Authorization": jwt,
          }
        }
        fetch(url, settingsCambio)
          .then(response => {
            console.log(response.status);
            //renderizar nuevamente las tareas
            obtenerListadoTareas(`${apiBaseUrl}/tasks`, jwt);
          })
      })
    });

  }



    /* ------------------------- POST: crear nueva tarea ------------------------ */
    function crearNuevaTarea(url, token, payload) {

        const configuraciones = {
            method: 'POST',
            headers: {
                authorization: token,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
        }

        fetch(url, configuraciones)
            .then(respuesta => respuesta.json())
            .then(data => {
                console.log(data);
                obtenerListadoTareas(`${apiBaseUrl}/tasks`, token);
            })
    }

    /* ---------------------- GET: obtener todas las tareas --------------------- */
    function obtenerListadoTareas(url, token) {

        const configuraciones = {
            method: 'GET',
            headers: {
                authorization: token
            }
        }

        fetch(url, configuraciones)
            .then(respuesta => respuesta.json())
            .then(data => {
                console.log(data);
                // el listado lo pintamos en pantalla
                renderizarListaTareas(data);
            })
    }

    /* ---------------------- GET: obtener info del usuario --------------------- */
    function obtenerNombreUsuario(url, token) {

        const configuraciones = {
            method: 'GET',
            headers: {
                authorization: token
            }
        }

        fetch(url, configuraciones)
            .then(respuesta => respuesta.json())
            .then(data => {
                console.log(data);
                nodoNombreUsuario.innerText = data.firstName;
            })
    }
});
```

`signup.js`

```js
/* -------------------------------------------------------------------------- */
/*                   logica aplicada en la pantalla de LOGIN                  */
/* -------------------------------------------------------------------------- */
const apiUrl = 'https://ctd-todo-api.herokuapp.com/v1/users';

window.addEventListener('load', function(){

    const formulario =  this.document.forms[0];
    const inputNombre = this.document.querySelector('#inputNombre');
    const inputApellido = this.document.querySelector('#inputApellido');
    const inputEmail = this.document.querySelector('#inputEmail');
    const inputPassword =  this.document.querySelector('#inputPassword');
    const inputPasswordRepetida =  this.document.querySelector('#inputPasswordRepetida');


    formulario.addEventListener('submit', function(event){
        event.preventDefault();

        const validacion = validacionNoVacio(inputNombre.value) && validacionNoVacio(inputApellido.value) && validacionNoVacio(inputEmail.value) && validacionNoVacio(inputPassword.value) && validacionAmbasContasenias(inputPassword.value,inputPasswordRepetida.value);

        if(validacion){
            //en caso de que esté todo correcto, iniciamos la peticion
            const datosUsuario = normalizacionRegister(inputNombre.value,inputApellido.value,inputEmail.value, inputPassword.value);
            console.log(datosUsuario);
            //consultamos al servidor y esperamos su respuesta
            fetchApiRegister(apiUrl, datosUsuario);
        }else{
            console.log("algun dato no es correcto");
        }

        formulario.reset();
    });

});

/* -------------------------------------------------------------------------- */
/*                      seccion de funciones disponibles                      */
/* -------------------------------------------------------------------------- */

function validacionNoVacio(texto) {
    let resultado = true;

    if(texto === ""){
        resultado = false;
    }

    return resultado
}

function validacionAmbasContasenias(constrasenia1, contrasenia2) {
    let resultado = true;

    if(constrasenia1 != contrasenia2){
        resultado = false;
    }

    return resultado;
}

function normalizacionRegister(nombre, apellido, email, password) {
    const usuario = {
        firstName: nombre.trim(),
        lastName: apellido.trim(),
        email: email.toLowerCase().trim(),
        password: password.trim()
    }
    
    return usuario;
}

function fetchApiRegister(url,payload) {

    const configuraciones = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(payload)
    }
    
    fetch(url, configuraciones)
    .then( respuesta => {
        console.log(respuesta);
        return respuesta.json()
    })
    .then( data => {
        console.log(data);
        console.log(data.jwt);
        //si llega correctamente un token
        if(data.jwt){
            localStorage.setItem('jwt', data.jwt);

            location.href = '/mis-tareas.html'
        }
    })
}
```

## [⏪ Atrás](./C15-proyecto-integrador-to-do-app.md)