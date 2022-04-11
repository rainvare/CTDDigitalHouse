// SEGURIDAD: Si no se encuentra en localStorage info del usuario
// no lo deja acceder a la página, redirigiendo al login inmediatamente.
if (!localStorage.jwt) {
  location.replace('./index.html');
}


/* ------ comienzan las funcionalidades una vez que carga el documento ------ */
window.addEventListener('load', function () {

  const urlTareas = 'https://ctd-todo-api.herokuapp.com/v1/tasks';
  const urlUsuario = 'https://ctd-todo-api.herokuapp.com/v1/users/getMe';
  const token = JSON.parse(localStorage.jwt);

  const formCrearTarea = document.querySelector('.nueva-tarea');
  const nuevaTarea = document.querySelector('#nuevaTarea');
  const btnCerrarSesion = document.querySelector('#closeApp');

  obtenerNombreUsuario();
  consultarTareas();


  /* -------------------------------------------------------------------------- */
  /*                          FUNCIÓN 1 - Cerrar sesión                         */
  /* -------------------------------------------------------------------------- */

  btnCerrarSesion.addEventListener('click', function () {
    const cerrarSesion = confirm("¿Desea cerrar sesión?");
    if (cerrarSesion) {
      //limpiamos el localstorage y redireccioamos a login
      localStorage.clear();
      location.replace('./index.html');
    }
  });

  /* -------------------------------------------------------------------------- */
  /*                 FUNCIÓN 2 - Obtener nombre de usuario [GET]                */
  /* -------------------------------------------------------------------------- */

  function obtenerNombreUsuario() {
    const settings = {
      method: 'GET',
      headers: {
        authorization: token
      }
    };
    console.log("Consultando mi usuario...");
    fetch(urlUsuario, settings)
      .then(response => response.json())
      .then(data => {
        console.log("Nombre de usuario:");
        console.log(data.firstName);
        const nombreUsuario = document.querySelector('.user-info p');
        nombreUsuario.innerText = data.firstName;
      })
      .catch(error => console.log(error));
  }


  /* -------------------------------------------------------------------------- */
  /*                 FUNCIÓN 3 - Obtener listado de tareas [GET]                */
  /* -------------------------------------------------------------------------- */

  function consultarTareas() {
    const settings = {
      method: 'GET',
      headers: {
        authorization: token
      }
    };
    console.log("Consultando mis tareas...");
    fetch(urlTareas, settings)
      .then(response => response.json())
      .then(tareas => {
        console.log("Tareas del usuario");
        console.table(tareas);

        renderizarTareas(tareas);
        botonesCambioEstado();
        botonBorrarTarea();
      })
      .catch(error => console.log(error));
  };


  /* -------------------------------------------------------------------------- */
  /*                    FUNCIÓN 4 - Crear nueva tarea [POST]                    */
  /* -------------------------------------------------------------------------- */

  formCrearTarea.addEventListener('submit', function (event) {
    event.preventDefault();
    console.log("crear terea");
    console.log(nuevaTarea.value);

    const payload = {
      description: nuevaTarea.value.trim()
    };
    const settings = {
      method: 'POST',
      body: JSON.stringify(payload),
      headers: {
        'Content-Type': 'application/json',
        authorization: token
      }
    }
    console.log("Creando un tarea en la base de datos");
    fetch(urlTareas, settings)
      .then(response => response.json())
      .then(tarea => {
        console.log(tarea)
        consultarTareas();
      })
      .catch(error => console.log(error));


    //limpiamos el form
    formCrearTarea.reset();
  })


  /* -------------------------------------------------------------------------- */
  /*                  FUNCIÓN 5 - Renderizar tareas en pantalla                 */
  /* -------------------------------------------------------------------------- */
  function renderizarTareas(listado) {

    // obtengo listados y limpio cualquier contenido interno
    const tareasPendientes = document.querySelector('.tareas-pendientes');
    const tareasTerminadas = document.querySelector('.tareas-terminadas');
    tareasPendientes.innerHTML = "";
    tareasTerminadas.innerHTML = "";

    // buscamos el numero de finalizadas
    const numeroFinalizadas = document.querySelector('#cantidad-finalizadas');
    let contador = 0;
    numeroFinalizadas.innerText = contador;

    listado.forEach(tarea => {
      //variable intermedia para manipular la fecha
      let fecha = new Date(tarea.createdAt);

      if (tarea.completed) {
        contador++;
        //lo mandamos al listado de tareas completas
        tareasTerminadas.innerHTML += `
          <li class="tarea">
            <div class="hecha">
              <i class="fa-regular fa-circle-check"></i>
            </div>
            <div class="descripcion">
              <p class="nombre">${tarea.description}</p>
              <div class="cambios-estados">
                <button class="change incompleta" id="${tarea.id}" ><i class="fa-solid fa-rotate-left"></i></button>
                <button class="borrar" id="${tarea.id}"><i class="fa-regular fa-trash-can"></i></button>
              </div>
            </div>
          </li>
                        `
      } else {
        //lo mandamos al listado de tareas sin terminar
        tareasPendientes.innerHTML += `
          <li class="tarea">
            <button class="change" id="${tarea.id}"><i class="fa-regular fa-circle"></i></button>
            <div class="descripcion">
              <p class="nombre">${tarea.description}</p>
              <p class="timestamp">${fecha.toLocaleDateString()}</p>
            </div>
          </li>
                        `
      }
      // actualizamos el contador en la pantalla
      numeroFinalizadas.innerText = contador;
    })
  }

  /* -------------------------------------------------------------------------- */
  /*                  FUNCIÓN 6 - Cambiar estado de tarea [PUT]                 */
  /* -------------------------------------------------------------------------- */
  function botonesCambioEstado() {
    const btnCambioEstado = document.querySelectorAll('.change');

    btnCambioEstado.forEach(boton => {
      //a cada boton le asignamos una funcionalidad
      boton.addEventListener('click', function (event) {
        console.log("Cambiando estado de tarea...");
        console.log(event);

        const id = event.target.id;
        const url = `${urlTareas}/${id}`
        const payload = {};

        //segun el tipo de boton que fue clickeado, cambiamos el estado de la tarea
        if (event.target.classList.contains('incompleta')) {
          // si está completada, la paso a pendiente
          payload.completed = false;
        } else {
          // sino, está pendiente, la paso a completada
          payload.completed = true;
        }

        const settingsCambio = {
          method: 'PUT',
          headers: {
            "Authorization": token,
            "Content-type": "application/json"
          },
          body: JSON.stringify(payload)
        }
        fetch(url, settingsCambio)
          .then(response => {
            console.log(response.status);
            //vuelvo a consultar las tareas actualizadas y pintarlas nuevamente en pantalla
            consultarTareas();
          })
      })
    });

  }


  /* -------------------------------------------------------------------------- */
  /*                     FUNCIÓN 7 - Eliminar tarea [DELETE]                    */
  /* -------------------------------------------------------------------------- */
  function botonBorrarTarea() {
    //obtenemos los botones de borrado
    const btnBorrarTarea = document.querySelectorAll('.borrar');

    btnBorrarTarea.forEach(boton => {
      //a cada boton de borrado le asignamos la funcionalidad
      boton.addEventListener('click', function (event) {
        const id = event.target.id;
        const url = `${urlTareas}/${id}`

        const settingsCambio = {
          method: 'DELETE',
          headers: {
            "Authorization": token,
          }
        }
        fetch(url, settingsCambio)
          .then(response => {
            console.log("Borrando tarea...");
            console.log(response.status);
            //vuelvo a consultar las tareas actualizadas y pintarlas nuevamente en pantalla
            consultarTareas();
          })
      })
    });
  }

});
