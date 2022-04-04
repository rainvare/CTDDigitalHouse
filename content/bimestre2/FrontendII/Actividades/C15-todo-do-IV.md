# C15 - To Do IV

En `mis-tareas.html` Sacamos el defer del script para que no se vea antes de hacer el login

```html
<script src="./scripts/tasks.js"></script>
```
```html
<body>
  <header>
    <nav>
      <a href="#">My ToDo's</a>
    </nav>

    <div class="user-info">
      <p>username</p>
      <div class="user-image"></div>
      <p id="closeApp">Cerrar sesión</p>
    </div>
  </header>


  <form class="nueva-tarea">
    <div class="not-done "></div>
    <input id="nuevaTarea" type="text" placeholder="Nueva tarea">
    <button type="submit">
      <img src="./assets/plus.png" alt="Agregar Tarea">
    </button>
  </form>


  <ul class="tareas-pendientes">
    // Hace a la experiencia de usuario, da un panorama de como va a ser el visual, esto se reemplaza.
    <div id="skeleton">
      <li class="tarea">
        <div class="not-done"></div>
        <div class="descripcion">
          <p class="nombre">Nueva tarea</p>
          <p class="timestamp">Creada: 15/07/21</p>
        </div>
      </li>
      <li class="tarea">
        <div class="not-done"></div>
        <div class="descripcion">
          <p class="nombre">Nueva tarea</p>
          <p class="timestamp">Creada: 15/07/21</p>
        </div>
      </li>
      <li class="tarea">
        <div class="not-done"></div>
        <div class="descripcion">
          <p class="nombre">Nueva tarea</p>
          <p class="timestamp">Creada: 15/07/21</p>
        </div>
      </li>
    </div>
    
  </ul>

  <h2 class="titulo-terminadas">Tareas terminadas</h2>
  <ul class="tareas-terminadas">

  </ul>

</body>
```

En `tasks.js`

```js
// chequear que exista un usuario loggeado si no existe devuelve null
const jwt = localStorage.getItem('jwt');
// si no existe un token, lo sacamos de la vista
if(!jwt){
    // Vuelve a la pagina anterior
    location.replace('/');
}


const apiBaseUrl = 'https://ctd-todo-api.herokuapp.com/v1';

window.addEventListener('load', function () {

  const jwt = localStorage.getItem('jwt')

  const nodoNombreUsuario = document.querySelector('.user-info p');
  const nodoFormulario = document.querySelector('.nueva-tarea');
  const inputNuevaTarea = document.querySelector('#nuevaTarea');
  const btnCerrar = document.querySelector('#closeApp');

  // Escucha evento click para cerrar sesion
  btnCerrar.addEventListener('click', function() {
      // cerrar sesion
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

      // Limpia las cajas del skeleton, esto evita tener algo anterior y sostenerlo
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
          // Renderizamos las tareas con la nueva incluida
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
            // el listado viene de data y lo renderizamos en pantalla
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

## [⏪ Atrás](./C15-proyecto-integrador-to-do-app.md)