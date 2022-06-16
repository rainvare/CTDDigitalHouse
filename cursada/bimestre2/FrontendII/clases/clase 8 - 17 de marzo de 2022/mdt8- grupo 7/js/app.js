
let contenedorNoticias= document.querySelector(".general");

for (let i = 0; i < noticias.length; i++) {
    const noticia= noticias[i];
    let clase = "sec1";
    if (noticias[i].tipoNacional==true) {
        clase= "sec1 noticiaNacional";
    }
    let plantillaNoticia= `
    <section class="${clase}">
    <img src="${noticia.imgUrl}"></img>
    <div>
    <h2>${noticia.titulo}</h2>
    <p>${noticia.descripcion}</p>
    <p>${noticia.fecha}</p>
    </div>
    </section >`
    contenedorNoticias.innerHTML+=plantillaNoticia;
    
}

