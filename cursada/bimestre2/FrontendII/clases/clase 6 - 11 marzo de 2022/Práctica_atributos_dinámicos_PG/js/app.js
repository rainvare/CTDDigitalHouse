//1- Agregar a la tarjeta, el atributo "class" con el valor "card"
let capturaDiv= document.querySelector('#tarjeta');
capturaDiv.setAttribute('class', 'card');

//2- Agregar a la imagen, el atributo "src" y asignarle la ruta al logo
let capturaImg=document.querySelector('#logo');
capturaImg.setAttribute('src', './img/Logo_youtube.jpg');

//3- Quitarle al titulo la clase que le está dando un formato feo
document.querySelector('h1').removeAttribute('class');

//4- Chequear si el link a youtube posee o no el atributo href
let chequeo=document.querySelector('#link_youtube').hasAttribute('href');

//5- Obtener el href del link a wikipedia y mostrarlo por consola
let linkURL=document.querySelector('#link_wikipedia').getAttribute('href');
