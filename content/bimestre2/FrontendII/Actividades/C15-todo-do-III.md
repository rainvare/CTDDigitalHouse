# C15 - To Do III

En `mis-tareas.html`

```html
<body>
  <header>
    <nav>
      <a href="#">My ToDo's</a>
    </nav>

    <div class="user-info">
      <p>username</p>
      <div class="user-image"></div>
      <p id="closeApp">Cerrar sesión</i>
      </p>
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
// 2. La url base de la API
const apiBaseUrl = 'https://ctd-todo-api.herokuapp.com/v1';

window.addEventListener('load', function () {
    // 4. Almaceno variable para almacenar token
    const jwt = localStorage.getItem('jwt')

    const nodoNombreUsuario = document.querySelector('.user-info p');
    const nodoFormulario = document.querySelector('.nueva-tarea');
    const inputNuevaTarea = document.querySelector('#nuevaTarea');

    // Funciones que se disparan al iniciar la app
    // 3. Apenas arranca el programa
    obtenerNombreUsuario(`${apiBaseUrl}/users/getMe`, jwt);
    obtenerListadoTareas(`${apiBaseUrl}/tasks`, jwt);

    // Evento que dispara submit del form
    nodoFormulario.addEventListener('submit', function (evento) {
        evento.preventDefault();
        //Este es el value que necesito para comunicarme con el endpoint
        console.log(inputNuevaTarea.value);

        // Objeto que pasaremos a funcion de crear nueva tarea
        const nuevaTarea = {
            description: inputNuevaTarea.value,
            completed: false
        }
        // Ejecutamos la funcion de crear una nueva tarea
        crearNuevaTarea(`${apiBaseUrl}/tasks`, jwt, nuevaTarea );

        //Limpiamos los campos una vez que termina
        nodoFormulario.reset();
    });


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
            })
    }

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
                // Si no hay tareas, obtengo un array vacio
                console.log(data);
            })
    }

    // 1. Obtiene nombre de usuario, se comunica con endpoint, recibe url y token, metodo lo define la api
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
                // Renderizo el nombre que viene de la respuesta de data
                nodoNombreUsuario.innerText = data.firstName;
            })
    }
});
```

## [⏪ Atrás](./C15-proyecto-integrador-to-do-app.md)