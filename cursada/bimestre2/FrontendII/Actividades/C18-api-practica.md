# C18 - API practica

```js

const apiUrl = 'https://jsonplaceholder.typicode.com';

// Petición fetch GET
fetch(`${apiUrl}/posts`)
    .then(response => {
        console.log(response);
        return response.json();
    })
    //Recibe respuesta de posteos y los renderiza en un ul>li
    .then(posteos => {
        console.log(posteos)

        const ul = document.createElement('ul');
        document.body.appendChild(ul);

        const lista = document.querySelector('ul');

        for (let i = 0; i < 10; i++) {
            lista.innerHTML += `<li>${posteos[i].title}</li>`
        }
    });

// Petición fetch POST

// Los datos que van a ser cargados, normalizados en un objeto literal
const nuevosDatos = {
    title: 'Nuevo titulo',
    body: 'bla bla blaaa',
    userId: 1,
}

// Información nueva que se quiere cargar, se dice payload
const payload = JSON.stringify(nuevosDatos);
// Settings que pasaremos como segundo parametro de fetch
const settings = {
    method: 'POST',
    headers: {
        'Content-type': 'application/json; charset=UTF-8'
        // En caso de enviar un token:
        'Authorization': 'wkucireubvierubvrubtvrjtbvrjt'
    },
    body: payload
}

// Petición fetch post
fetch(`${apiUrl}/posts`, settings)
.then((response) => response.json())
.then((json) => {
    // log del registro creado
    console.log("REGISTRO CREADO:");
    console.log(json)
});

```

## [⏪ Atrás](../README.md)