let imagenes = [];

//Solicitamos las URL de imagenes.
for(let i=0; i<3 ;i++){
    let url = prompt("ingrese la url de una imagen");
    imagenes.push(url);
}
//utilizar estos links para rellenar los SRC de cada imagen.

//Capturo los nodos de los elementos a trabajar.
const nodosImg=document.querySelectorAll('.imagen');
const nodosAnchor=document.querySelectorAll('.ruta-img');

//Agrego atributos y valores a elementos img y anchors.
for(let i=0; i<imagenes.length; i++){
    nodosImg[i].setAttribute('src', imagenes[i]);
    nodosAnchor[i].setAttribute('href', imagenes[i]);
    nodosAnchor[i].setAttribute('target', '_blank');
    
    //Armo el nodo de un parrafo completo.
    let creoAnchor=document.createElement('a');
    let creoItemLi=document.createElement('li');
    let creoTexto=document.createTextNode(`Ir al link de la imágen ${i+1}`);
    
    //Inserto nodos creados en sus correspondientes lugares.
    creoItemLi.appendChild(creoTexto);//El texto dentor del li.
    creoAnchor.appendChild(creoItemLi);//El li dentro del anchor.

    //Agergo el atributo href a los anchors de la lista.
    creoAnchor.setAttribute('href', imagenes[i]);//Doy como valor de atributo los links del array obtenido por el user.

    //Selecciono la caja de párrafos.
    const cajaParrafos=document.querySelector('.parrafos');
    
    //Inserto el párrafo dinamico en el DOM.
    cajaParrafos.appendChild(creoAnchor);
}

