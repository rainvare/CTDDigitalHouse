/*
REQUERIMIENTOS
- utilizar el formulario para captar el texto ingresado

- implementar el evento "submit", utilizarlo para guardar el comentario en un array

- cada vez que se agrega un nuevo comentario renderizarlo en una etiqueta "p"(sacar del html los hardcodeados y hacerlo dinamico)

- constantemente guardar la informacion en localStorage, si se recarga la pagina deberian mantenerse los comentarios
*/
const comentario = document.getElementById('comentario')
const comentarios =document.querySelector('.comentarios')
const btn = document.querySelector('.clear')
const form = document.forms[0]

 

const historial = JSON.parse(localStorage.getItem('datos')) || [];
renderizar(historial);

form.addEventListener('submit', (e)=>{
    e.preventDefault();
    historial.push(comentario.value);
    localStorage.setItem('datos', JSON.stringify(historial))
    renderizar(historial);
})


function renderizar(historial){
    comentarios.innerHTML = "";
    historial.forEach( (elem => {
        const parrafo = document.createElement("p");
        const texto = document.createTextNode(elem);
        parrafo.appendChild(texto); 
        comentarios.appendChild(parrafo);
    }))

}
btn.addEventListener("click", (e)=>{
    e.preventDefault();
    historial = []
//historial.innerHTML = "";
    localStorage.reload('comentarios') 
});
