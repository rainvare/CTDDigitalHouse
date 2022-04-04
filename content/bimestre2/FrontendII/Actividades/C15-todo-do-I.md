# C15 - To Do I

En `index.html`

```html
<body>
  <div class="left">
    <img src="./assets/persona-login.png" alt="">
  </div>

  <div class="right">
    <form>
        <div class="form-header">
            <p>To-Do App</p>
        </div>
        <h1>Ingresar</h1>

        <label>
            Email:
            <input id="inputEmail" type="text">
        </label>
        <label>
            Contraseña:
            <input id="inputPassword" type="password">
        </label>

        <button type="submit">Ingresar</button>

    </form>
    <div class="ingresarA">
      <a href="signup.html">¿No tiene una cuenta? Regístrese aquí</a>
    </div>
  </div>

</body>
```

En `login.js`

```js
window.addEventListener('load', function(){
    // 1. Captamos información del formulario
    const formulario =  this.document.forms[0];
    const inputEmail = this.document.querySelector('#inputEmail');
    const inputPassword =  this.document.querySelector('#inputPassword');

    // 2. Escuchamos el submit
    formulario.addEventListener('submit', function(event){
        event.preventDefault();

        console.log(inputEmail.value);
        console.log(inputPassword.value);

    });

});
```
## [⏪ Atrás](./C15-proyecto-integrador-to-do-app.md)