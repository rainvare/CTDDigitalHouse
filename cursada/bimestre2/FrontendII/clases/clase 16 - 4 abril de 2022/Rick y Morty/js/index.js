const url =  'https://rickandmortyapi.com/api/character';
const anteriorBtn = document.querySelector('#anterior');
const siguienteBtn = document.querySelector('#siguiente');
const numPagina = document.querySelector('#numPagina')
const nodoTarjeta = document.querySelector('.tarjeta');
const imagen = document.querySelector('img');

let num = 1;
consultaApi(num);

anteriorBtn.addEventListener('click', function(){
    if (num < 1) {
        anteriorBtn.setAttribute('disabled','');
    }
    else {
        num--
    }
     console.log(num)
     nodoTarjeta.innerHTML =""
    consultaApi(num);
})

siguienteBtn.addEventListener('click', function(){
    if (num > 42) {
        siguienteBtn.setAttribute('disabled','');
    }
    else {
        num++
    }
     console.log(num)
     nodoTarjeta.innerHTML =""

    consultaApi(num);
})


function consultaApi(num) {
    fetch(url + "?page=" + num)
    .then( respuesta => {
        console.log(respuesta)
        console.log(respuesta.status)
        return respuesta.json()
    }).then( data => {
        console.log(data.results);
        data.results.forEach(personaje => {
           renderizar(personaje);           
       });
    }).catch( error =>{
        console.log(error);
    })
}
 
function renderizar(personaje) {
    nodoTarjeta.innerHTML += ` 
    <div>
        <ul> 
            <h2>${personaje.name}</h2>
            <li>${personaje.species}</li>
            <li>${personaje.type}</li>
            <li>${personaje.status}</li>
        </ul>
        <img src="${personaje.image}" alt="personaje"> 
     </div>
      `;
    numPagina.innerHTML = `${num}`;
};