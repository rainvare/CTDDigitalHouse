# C15 - To Do II

En `index.html`

```html
<body>
    <div class="left">
        <img src="./assets/persona-login.png" alt="" />
    </div>

    <div class="right">
        <form>
            <div class="form-header">
                <p>To-Do App</p>
            </div>
            <h1>Ingresar</h1>

            <label>
                Email:
                <input id="inputEmail" type="text" />
            </label>
            <label>
                Contraseña:
                <input id="inputPassword" type="password" />
            </label>

            <button type="submit">Ingresar</button>
        </form>
        <div class="ingresarA">
            <a href="signup.html">¿No tiene una cuenta? Regístrese aquí</a>
        </div>
    </div>
</body>
```

Lógica aplicada en la pantalla de LOGIN:

En `login.js`

```js
// 4. Endpoint de login
const apiUrl = "https://ctd-todo-api.herokuapp.com/v1/users/login";

window.addEventListener("load", function () {
    const formulario = this.document.forms[0];
    const inputEmail = this.document.querySelector("#inputEmail");
    const inputPassword = this.document.querySelector("#inputPassword");

    // 1. Prevenimos envío por default del botón submit
    formulario.addEventListener("submit", function (event) {
        event.preventDefault();

        // 5. Hacemos una validación del input email y del password, si alguna falla sera false
        const validacion = validacionNoVacio(inputEmail.value) && validacionNoVacio(inputPassword.value);
        // 6. Si validacion es true quiero ver los datos.
        if (validacion) {
            // En caso de que esté todo correcto, iniciamos la petición
            const datosUsuario = normalizacionLogin(inputEmail.value, inputPassword.value);
            console.log(datosUsuario);
            // Si la validacion es correcta: consultamos al servidor y esperamos su respuesta
            fetchApiLogin(apiUrl, datosUsuario);
        } else {
            console.log("algun dato no es correcto");
        }
        // Limpiamos el formulario
        formulario.reset();
    });
});

// 3. Funcion de validacion
function validacionNoVacio(texto) {
    let resultado = true;
    // Causa 1 de no estar validado: que este vacío.
    if (texto === "") {
      resultado = false;
    }

    return resultado;
}

// 2. Retorna objeto preparado según lo espera el servidor
function normalizacionLogin(email, password) {
    const usuario = {
        // Normalizamos las mayúsculas y sacamos espacios con .trim()
        email: email.toLowerCase().trim(),
        // Sacamos los espacios del password
        password: password.trim(),
    };

    return usuario;
}
// Recibe payload (que es la info de nuestro objeto normalizado)
function fetchApiLogin(url, payload) {
  // Recibe headers, body y method para ser enviado en fetch
  const configuraciones = {
    method: "POST",
    // Headers salen de la documentacion, cuando hay guion al medio tiene que haber comillas
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(payload),
  };

  fetch(url, configuraciones)
      .then((respuesta) => {
          console.log(respuesta);
          return respuesta.json();
      })
      .then((data) => {
          console.log(data);
          // Accedemos directamente al token producto del login
          console.log(data.jwt);
          //si llega correctamente un token
          if (data.jwt) {
            // Guardamos token en localStorage
            localStorage.setItem("jwt", data.jwt);
            // Redirigimos al html mis-tareas.html
            location.href = "/mis-tareas.html";
          }
      });
}
```
## [⏪ Atrás](./C15-proyecto-integrador-to-do-app.md)