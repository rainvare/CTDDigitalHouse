const nombreUsuario = document.querySelector("#nombre")
const contra = document.querySelector("#pass")
const telefono = document.querySelector("#tel")
const formulario = document.querySelector("form")

let usuario = {
    nombreCompleto: "",
    tel: "",
}

//Usamos el event del form submit, para tomar todos los datos a la vez
formulario.addEventListener("submit", (e) => {
    e.preventDefault()
    //creamos la funcion que normaliza datos dentro del submit 
    normalizarDatos(nombreUsuario.value, telefono.value)
    console.log(usuario)
})

function normalizarDatos(nombre, tele) {
    //quita espacios en blanco + eleva caracteres a mayusculas
    usuario.nombreCompleto = nombre.trim().toUpperCase()
    //comprueba si es un numero y nos devuelve true (aunque los numeros los devuelva en una cadena)
    console.log(!isNaN(tele))
    if (!isNaN(tele)) {
        //parsea los datos para que efectivamente javascript los lea como numbers
        usuario.tel = parseInt(tele)
    }  
}

//Aclaracion: el evento de blur nos permitira a futuro agregar un estilo que de cuenta de un error ni bien el usuario quita el foco del input